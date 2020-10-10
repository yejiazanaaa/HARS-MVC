// jquery.event.move
//
// 1.3.1
//
// Stephen Band
//
// Triggers 'movestart', 'move' and 'moveend' events after
// mousemoves following a mousedown cross a distance threshold,
// similar to the native 'dragstart', 'drag' and 'dragend' events.
// Move events are throttled to animation frames. Move event objects
// have the properties:
//
// pageX:
// pageY:   Page coordinates of pointer.
// startX:
// startY:  Page coordinates of pointer at movestart.
// distX:
// distY:  Distance the pointer has moved since movestart.
// deltaX:
// deltaY:  Distance the finger has moved since last event.
// velocityX:
// velocityY:  Average velocity over last few events.


(function (module) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['jquery'], module);
    } else {
        // Browser globals
        module(jQuery);
    }
})(function(jQuery, undefined){

    var // Number of pixels a pressed pointer travels before movestart
        // event is fired.
        threshold = 6,

        add = jQuery.event.add,

        remove = jQuery.event.remove,

        // Just sugar, so we can have arguments in the same order as
        // add and remove.
        trigger = function(node, type, data) {
            jQuery.event.trigger(type, data, node);
        },

        // Shim for requestAnimationFrame, falling back to timer. See:
        // see http://paulirish.com/2011/requestanimationframe-for-smart-animating/
        requestFrame = (function(){
            return (
                window.requestAnimationFrame ||
                window.webkitRequestAnimationFrame ||
                window.mozRequestAnimationFrame ||
                window.oRequestAnimationFrame ||
                window.msRequestAnimationFrame ||
                function(fn, element){
                    return window.setTimeout(function(){
                        fn();
                    }, 25);
                }
            );
        })(),

        ignoreTags = {
            textarea: true,
            input: true,
            select: true,
            button: true
        },

        mouseevents = {
            move: 'mousemove',
            cancel: 'mouseup dragstart',
            end: 'mouseup'
        },

        touchevents = {
            move: 'touchmove',
            cancel: 'touchend',
            end: 'touchend'
        };


    // Constructors

    function Timer(fn){
        var callback = fn,
            active = false,
            running = false;

        function trigger(time) {
            if (active){
                callback();
                requestFrame(trigger);
                running = true;
                active = false;
            }
            else {
                running = false;
            }
        }

        this.kick = function(fn) {
            active = true;
            if (!running) { trigger(); }
        };

        this.end = function(fn) {
            var cb = callback;

            if (!fn) { return; }

            // If the timer is not running, simply call the end callback.
            if (!running) {
                fn();
            }
            // If the timer is running, and has been kicked lately, then
            // queue up the current callback and the end callback, otherwise
            // just the end callback.
            else {
                callback = active ?
                    function(){ cb(); fn(); } :
                    fn ;

                active = true;
            }
        };
    }


    // Functions

    function returnTrue() {
        return true;
    }

    function returnFalse() {
        return false;
    }

    function preventDefault(e) {
        e.preventDefault();
    }

    function preventIgnoreTags(e) {
        // Don't prevent interaction with form elements.
        if (ignoreTags[ e.target.tagName.toLowerCase() ]) { return; }

        e.preventDefault();
    }

    function isLeftButton(e) {
        // Ignore mousedowns on any button other than the left (or primary)
        // mouse button, or when a modifier key is pressed.
        return (e.which === 1 && !e.ctrlKey && !e.altKey);
    }

    function identifiedTouch(touchList, id) {
        var i, l;

        if (touchList.identifiedTouch) {
            return touchList.identifiedTouch(id);
        }

        // touchList.identifiedTouch() does not exist in
        // webkit yet… we must do the search ourselves...

        i = -1;
        l = touchList.length;

        while (++i < l) {
            if (touchList[i].identifier === id) {
                return touchList[i];
            }
        }
    }

    function changedTouch(e, event) {
        var touch = identifiedTouch(e.changedTouches, event.identifier);

        // This isn't the touch you're looking for.
        if (!touch) { return; }

        // Chrome Android (at least) includes touches that have not
        // changed in e.changedTouches. That's a bit annoying. Check
        // that this touch has changed.
        if (touch.pageX === event.pageX && touch.pageY === event.pageY) { return; }

        return touch;
    }


    // Handlers that decide when the first movestart is triggered

    function mousedown(e){
        var data;

        if (!isLeftButton(e)) { return; }

        data = {
            target: e.target,
            startX: e.pageX,
            startY: e.pageY,
            timeStamp: e.timeStamp
        };

        add(document, mouseevents.move, mousemove, data);
        add(document, mouseevents.cancel, mouseend, data);
    }

    function mousemove(e){
        var data = e.data;

        checkThreshold(e, data, e, removeMouse);
    }

    function mouseend(e) {
        removeMouse();
    }

    function removeMouse() {
        remove(document, mouseevents.move, mousemove);
        remove(document, mouseevents.cancel, mouseend);
    }

    function touchstart(e) {
        var touch, template;

        // Don't get in the way of interaction with form elements.
        if (ignoreTags[ e.target.tagName.toLowerCase() ]) { return; }

        touch = e.changedTouches[0];

        // iOS live updates the touch objects whereas Android gives us copies.
        // That means we can't trust the touchstart object to stay the same,
        // so we must copy the data. This object acts as a template for
        // movestart, move and moveend event objects.
        template = {
            target: touch.target,
            startX: touch.pageX,
            startY: touch.pageY,
            timeStamp: e.timeStamp,
            identifier: touch.identifier
        };

        // Use the touch identifier as a namespace, so that we can later
        // remove handlers pertaining only to this touch.
        add(document, touchevents.move + '.' + touch.identifier, touchmove, template);
        add(document, touchevents.cancel + '.' + touch.identifier, touchend, template);
    }

    function touchmove(e){
        var data = e.data,
            touch = changedTouch(e, data);

        if (!touch) { return; }

        checkThreshold(e, data, touch, removeTouch);
    }

    function touchend(e) {
        var template = e.data,
            touch = identifiedTouch(e.changedTouches, template.identifier);

        if (!touch) { return; }

        removeTouch(template.identifier);
    }

    function removeTouch(identifier) {
        remove(document, '.' + identifier, touchmove);
        remove(document, '.' + identifier, touchend);
    }


    // Logic for deciding when to trigger a movestart.

    function checkThreshold(e, template, touch, fn) {
        var distX = touch.pageX - template.startX,
            distY = touch.pageY - template.startY;

        // Do nothing if the threshold has not been crossed.
        if ((distX * distX) + (distY * distY) < (threshold * threshold)) { return; }

        triggerStart(e, template, touch, distX, distY, fn);
    }

    function handled() {
        // this._handled should return false once, and after return true.
        this._handled = returnTrue;
        return false;
    }

    function flagAsHandled(e) {
        e._handled();
    }

    function triggerStart(e, template, touch, distX, distY, fn) {
        var node = template.target,
            touches, time;

        touches = e.targetTouches;
        time = e.timeStamp - template.timeStamp;

        // Create a movestart object with some special properties that
        // are passed only to the movestart handlers.
        template.type = 'movestart';
        template.distX = distX;
        template.distY = distY;
        template.deltaX = distX;
        template.deltaY = distY;
        template.pageX = touch.pageX;
        template.pageY = touch.pageY;
        template.velocityX = distX / time;
        template.velocityY = distY / time;
        template.targetTouches = touches;
        template.finger = touches ?
            touches.length :
            1 ;

        // The _handled method is fired to tell the default movestart
        // handler that one of the move events is bound.
        template._handled = handled;

        // Pass the touchmove event so it can be prevented if or when
        // movestart is handled.
        template._preventTouchmoveDefault = function() {
            e.preventDefault();
        };

        // Trigger the movestart event.
        trigger(template.target, template);

        // Unbind handlers that tracked the touch or mouse up till now.
        fn(template.identifier);
    }


    // Handlers that control what happens following a movestart

    function activeMousemove(e) {
        var event = e.data.event,
            timer = e.data.timer;

        updateEvent(event, e, e.timeStamp, timer);
    }

    function activeMouseend(e) {
        var event = e.data.event,
            timer = e.data.timer;

        removeActiveMouse();

        endEvent(event, timer, function() {
            // Unbind the click suppressor, waiting until after mouseup
            // has been handled.
            setTimeout(function(){
                remove(event.target, 'click', returnFalse);
            }, 0);
        });
    }

    function removeActiveMouse(event) {
        remove(document, mouseevents.move, activeMousemove);
        remove(document, mouseevents.end, activeMouseend);
    }

    function activeTouchmove(e) {
        var event = e.data.event,
            timer = e.data.timer,
            touch = changedTouch(e, event);

        if (!touch) { return; }

        // Stop the interface from gesturing
        e.preventDefault();

        event.targetTouches = e.targetTouches;
        updateEvent(event, touch, e.timeStamp, timer);
    }

    function activeTouchend(e) {
        var event = e.data.event,
            timer = e.data.timer,
            touch = identifiedTouch(e.changedTouches, event.identifier);

        // This isn't the touch you're looking for.
        if (!touch) { return; }

        removeActiveTouch(event);
        endEvent(event, timer);
    }

    function removeActiveTouch(event) {
        remove(document, '.' + event.identifier, activeTouchmove);
        remove(document, '.' + event.identifier, activeTouchend);
    }


    // Logic for triggering move and moveend events

    function updateEvent(event, touch, timeStamp, timer) {
        var time = timeStamp - event.timeStamp;

        event.type = 'move';
        event.distX =  touch.pageX - event.startX;
        event.distY =  touch.pageY - event.startY;
        event.deltaX = touch.pageX - event.pageX;
        event.deltaY = touch.pageY - event.pageY;

        // Average the velocity of the last few events using a decay
        // curve to even out spurious jumps in values.
        event.velocityX = 0.3 * event.velocityX + 0.7 * event.deltaX / time;
        event.velocityY = 0.3 * event.velocityY + 0.7 * event.deltaY / time;
        event.pageX =  touch.pageX;
        event.pageY =  touch.pageY;

        timer.kick();
    }

    function endEvent(event, timer, fn) {
        timer.end(function(){
            event.type = 'moveend';

            trigger(event.target, event);

            return fn && fn();
        });
    }


    // jQuery special event definition

    function setup(data, namespaces, eventHandle) {
        // Stop the node from being dragged
        //add(this, 'dragstart.move drag.move', preventDefault);

        // Prevent text selection and touch interface scrolling
        //add(this, 'mousedown.move', preventIgnoreTags);

        // Tell movestart default handler that we've handled this
        add(this, 'movestart.move', flagAsHandled);

        // Don't bind to the DOM. For speed.
        return true;
    }

    function teardown(namespaces) {
        remove(this, 'dragstart drag', preventDefault);
        remove(this, 'mousedown touchstart', preventIgnoreTags);
        remove(this, 'movestart', flagAsHandled);

        // Don't bind to the DOM. For speed.
        return true;
    }

    function addMethod(handleObj) {
        // We're not interested in preventing defaults for handlers that
        // come from internal move or moveend bindings
        if (handleObj.namespace === "move" || handleObj.namespace === "moveend") {
            return;
        }

        // Stop the node from being dragged
        add(this, 'dragstart.' + handleObj.guid + ' drag.' + handleObj.guid, preventDefault, undefined, handleObj.selector);

        // Prevent text selection and touch interface scrolling
        add(this, 'mousedown.' + handleObj.guid, preventIgnoreTags, undefined, handleObj.selector);
    }

    function removeMethod(handleObj) {
        if (handleObj.namespace === "move" || handleObj.namespace === "moveend") {
            return;
        }

        remove(this, 'dragstart.' + handleObj.guid + ' drag.' + handleObj.guid);
        remove(this, 'mousedown.' + handleObj.guid);
    }

    jQuery.event.special.movestart = {
        setup: setup,
        teardown: teardown,
        add: addMethod,
        remove: removeMethod,

        _default: function(e) {
            var template, data;

            // If no move events were bound to any ancestors of this
            // target, high tail it out of here.
            if (!e._handled()) { return; }

            template = {
                target: e.target,
                startX: e.startX,
                startY: e.startY,
                pageX: e.pageX,
                pageY: e.pageY,
                distX: e.distX,
                distY: e.distY,
                deltaX: e.deltaX,
                deltaY: e.deltaY,
                velocityX: e.velocityX,
                velocityY: e.velocityY,
                timeStamp: e.timeStamp,
                identifier: e.identifier,
                targetTouches: e.targetTouches,
                finger: e.finger
            };

            data = {
                event: template,
                timer: new Timer(function(time){
                    trigger(e.target, template);
                })
            };

            if (e.identifier === undefined) {
                // We're dealing with a mouse
                // Stop clicks from propagating during a move
                add(e.target, 'click', returnFalse);
                add(document, mouseevents.move, activeMousemove, data);
                add(document, mouseevents.end, activeMouseend, data);
            }
            else {
                // We're dealing with a touch. Stop touchmove doing
                // anything defaulty.
                e._preventTouchmoveDefault();
                add(document, touchevents.move + '.' + e.identifier, activeTouchmove, data);
                add(document, touchevents.end + '.' + e.identifier, activeTouchend, data);
            }
        }
    };

    jQuery.event.special.move = {
        setup: function() {
            // Bind a noop to movestart. Why? It's the movestart
            // setup that decides whether other move events are fired.
            add(this, 'movestart.move', jQuery.noop);
        },

        teardown: function() {
            remove(this, 'movestart.move', jQuery.noop);
        }
    };

    jQuery.event.special.moveend = {
        setup: function() {
            // Bind a noop to movestart. Why? It's the movestart
            // setup that decides whether other move events are fired.
            add(this, 'movestart.moveend', jQuery.noop);
        },

        teardown: function() {
            remove(this, 'movestart.moveend', jQuery.noop);
        }
    };

    add(document, 'mousedown.move', mousedown);
    add(document, 'touchstart.move', touchstart);

    // Make jQuery copy touch event properties over to the jQuery event
    // object, if they are not already listed. But only do the ones we
    // really need. IE7/8 do not have Array#indexOf(), but nor do they
    // have touch events, so let's assume we can ignore them.
    if (typeof Array.prototype.indexOf === 'function') {
        (function(jQuery, undefined){
            var props = ["changedTouches", "targetTouches"],
                l = props.length;

            while (l--) {
                if (jQuery.event.props.indexOf(props[l]) === -1) {
                    jQuery.event.props.push(props[l]);
                }
            }
        })(jQuery);
    };
});



// jQuery.event.swipe
// 0.5
// Stephen Band

// Dependencies
// jQuery.event.move 1.2

// One of swipeleft, swiperight, swipeup or swipedown is triggered on
// moveend, when the move has covered a threshold ratio of the dimension
// of the target node, or has gone really fast. Threshold and velocity
// sensitivity changed with:
//
// jQuery.event.special.swipe.settings.threshold
// jQuery.event.special.swipe.settings.sensitivity

(function (thisModule) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['jquery', undefined, 'jquery.event.move'], thisModule);
    } else if ((typeof module !== "undefined" && module !== null) && module.exports) {
        module.exports = thisModule;
    } else {
        // Browser globals
        thisModule(jQuery);
    }
})(function(jQuery, undefined){
    var add = jQuery.event.add,

        remove = jQuery.event.remove,

        // Just sugar, so we can have arguments in the same order as
        // add and remove.
        trigger = function(node, type, data) {
            jQuery.event.trigger(type, data, node);
        },

        settings = {
            // Ratio of distance over target finger must travel to be
            // considered a swipe.
            threshold: 0.4,
            // Faster fingers can travel shorter distances to be considered
            // swipes. 'sensitivity' controls how much. Bigger is shorter.
            sensitivity: 6
        };

    function moveend(e) {
        var w, h, event;

        w = e.currentTarget.offsetWidth;
        h = e.currentTarget.offsetHeight;

        // Copy over some useful properties from the move event
        event = {
            distX: e.distX,
            distY: e.distY,
            velocityX: e.velocityX,
            velocityY: e.velocityY,
            finger: e.finger
        };

        // Find out which of the four directions was swiped
        if (e.distX > e.distY) {
            if (e.distX > -e.distY) {
                if (e.distX/w > settings.threshold || e.velocityX * e.distX/w * settings.sensitivity > 1) {
                    event.type = 'swiperight';
                    trigger(e.currentTarget, event);
                }
            }
            else {
                if (-e.distY/h > settings.threshold || e.velocityY * e.distY/w * settings.sensitivity > 1) {
                    event.type = 'swipeup';
                    trigger(e.currentTarget, event);
                }
            }
        }
        else {
            if (e.distX > -e.distY) {
                if (e.distY/h > settings.threshold || e.velocityY * e.distY/w * settings.sensitivity > 1) {
                    event.type = 'swipedown';
                    trigger(e.currentTarget, event);
                }
            }
            else {
                if (-e.distX/w > settings.threshold || e.velocityX * e.distX/w * settings.sensitivity > 1) {
                    event.type = 'swipeleft';
                    trigger(e.currentTarget, event);
                }
            }
        }
    }

    function getData(node) {
        var data = jQuery.data(node, 'event_swipe');

        if (!data) {
            data = { count: 0 };
            jQuery.data(node, 'event_swipe', data);
        }

        return data;
    }

    jQuery.event.special.swipe =
        jQuery.event.special.swipeleft =
            jQuery.event.special.swiperight =
                jQuery.event.special.swipeup =
                    jQuery.event.special.swipedown = {
                        setup: function( data, namespaces, eventHandle ) {
                            var data = getData(this);

                            // If another swipe event is already setup, don't setup again.
                            if (data.count++ > 0) { return; }

                            add(this, 'moveend', moveend);

                            return true;
                        },

                        teardown: function() {
                            var data = getData(this);

                            // If another swipe event is still setup, don't teardown.
                            if (--data.count > 0) { return; }

                            remove(this, 'moveend', moveend);

                            return true;
                        },

                        settings: settings
                    };
});





/**
 *   Unslider
 *   version 2.0
 *   by @idiot and friends
 */

(function(factory) {
    if (typeof module === 'object' && typeof module.exports === 'object') {
        factory(require('jquery'));
    } else if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define([], factory(window.jQuery));
    } else {
        factory(window.jQuery);
    }
}(function($) {
    //  Don't throw any errors when jQuery
    if(!$) {
        return console.warn('Unslider needs jQuery');
    }

    $.Unslider = function(context, options) {
        var self = this;

        //  Create an Unslider reference we can use everywhere
        self._ = 'unslider';

        //  Store our default options in here
        //  Everything will be overwritten by the jQuery plugin though
        self.defaults = {
            //  Should the slider move on its own or only when
            //  you interact with the nav/arrows?
            //  Only accepts boolean true/false.
            autoplay: false,

            //  3 second delay between slides moving, pass
            //  as a number in milliseconds.
            delay: 3000,

            //  Animation speed in millseconds
            speed: 750,

            //  An easing string to use. If you're using Velocity, use a
            //  Velocity string otherwise you can use jQuery/jQ UI options.
            easing: 'swing', // [.42, 0, .58, 1],

            //  Does it support keyboard arrows?
            //  Can pass either true or false -
            //  or an object with the keycodes, like so:
            //  {
            //	 prev: 37,
            //	 next: 39
            // }
            //  You can call any internal method name
            //  before the keycode and it'll be called.
            keys: {
                prev: 37,
                next: 39
            },

            //  Do you want to generate clickable navigation
            //  to skip to each slide? Accepts boolean true/false or
            //  a callback function per item to generate.
            nav: true,

            //  Should there be left/right arrows to go back/forth?
            //   -> This isn't keyboard support.
            //  Either set true/false, or an object with the HTML
            //  elements for each arrow like below:
            arrows: {
                prev: '<a class="' + self._ + '-arrow prev">Prev</a>',
                next: '<a class="' + self._ + '-arrow next">Next</a>'
            },

            //  How should Unslider animate?
            //  It can do one of the following types:
            //  "fade": each slide fades in to each other
            //  "horizontal": each slide moves from left to right
            //  "vertical": each slide moves from top to bottom
            animation: 'horizontal',

            //  If you don't want to use a list to display your slides,
            //  you can change it here. Not recommended and you'll need
            //  to adjust the CSS accordingly.
            selectors: {
                container: 'ul:first',
                slides: 'li'
            },

            //  Do you want to animate the heights of each slide as
            //  it moves
            animateHeight: false,

            //  Active class for the nav
            activeClass: self._ + '-active',

            //  Have swipe support?
            //  You can set this here with a boolean and always use
            //  initSwipe/destroySwipe later on.
            swipe: true,
            // Swipe threshold -
            // lower float for enabling short swipe
            swipeThreshold: 0.2
        };

        //  Set defaults
        self.$context = context;
        self.options = {};

        //  Leave our elements blank for now
        //  Since they get changed by the options, we'll need to
        //  set them in the init method.
        self.$parent = null;
        self.$container = null;
        self.$slides = null;
        self.$nav = null;
        self.$arrows = [];

        //  Set our indexes and totals
        self.total = 0;
        self.current = 0;

        //  Generate a specific random ID so we don't dupe events
        self.prefix = self._ + '-';
        self.eventSuffix = '.' + self.prefix + ~~(Math.random() * 2e3);

        //  In case we're going to use the autoplay
        self.interval = null;

        //  Get everything set up innit
        self.init = function(options) {
            //  Set up our options inside here so we can re-init at
            //  any time
            self.options = $.extend({}, self.defaults, options);

            //  Our elements
            self.$container = self.$context.find(self.options.selectors.container).addClass(self.prefix + 'wrap');
            self.$slides = self.$container.children(self.options.selectors.slides);

            //  We'll manually init the container
            self.setup();

            //  We want to keep this script as small as possible
            //  so we'll optimise some checks
            $.each(['nav', 'arrows', 'keys', 'infinite'], function(index, module) {
                self.options[module] && self['init' + $._ucfirst(module)]();
            });

            //  Add swipe support
            if(jQuery.event.special.swipe && self.options.swipe) {
                self.initSwipe();
            }

            //  If autoplay is set to true, call self.start()
            //  to start calling our timeouts
            self.options.autoplay && self.start();

            //  We should be able to recalculate slides at will
            self.calculateSlides();

            //  Listen to a ready event
            self.$context.trigger(self._ + '.ready');

            //  Everyday I'm chainin'
            return self.animate(self.options.index || self.current, 'init');
        };

        self.setup = function() {
            //  Add a CSS hook to the main element
            self.$context.addClass(self.prefix + self.options.animation).wrap('<div class="' + self._ + '" />');
            self.$parent = self.$context.parent('.' + self._);

            //  We need to manually check if the container is absolutely
            //  or relatively positioned
            var position = self.$context.css('position');

            //  If we don't already have a position set, we'll
            //  automatically set it ourselves
            if(position === 'static') {
                self.$context.css('position', 'relative');
            }

            self.$context.css('overflow', 'hidden');
        };

        //  Set up the slide widths to animate with
        //  so the box doesn't float over
        self.calculateSlides = function() {
            self.total = self.$slides.length;

            //  Set the total width
            if(self.options.animation !== 'fade') {
                var prop = 'width';

                if(self.options.animation === 'vertical') {
                    prop = 'height';
                }

                self.$container.css(prop, (self.total * 100) + '%').addClass(self.prefix + 'carousel');
                self.$slides.css(prop, (100 / self.total) + '%');
            }
        };


        //  Start our autoplay
        self.start = function() {
            self.interval = setTimeout(function() {
                //  Move on to the next slide
                self.next();

                //  If we've got autoplay set up
                //  we don't need to keep starting
                //  the slider from within our timeout
                //  as .animate() calls it for us
            }, self.options.delay);

            return self;
        };

        //  And pause our timeouts
        //  and force stop the slider if needed
        self.stop = function() {
            clearTimeout(self.interval);

            return self;
        };


        //  Set up our navigation
        self.initNav = function() {
            var $nav = $('<div class="' + self.prefix + 'nav"><ol /></div>');

            //  Build our click navigation item-by-item
            self.$slides.each(function(key) {
                //  If we've already set a label, let's use that
                //  instead of generating one
                var label = this.getAttribute('data-nav') || key + 1;

                //  Listen to any callback functions
                if($.isFunction(self.options.nav)) {
                    label = self.options.nav.call(self.$slides.eq(key), key, label);
                }

                //  And add it to our navigation item
                $nav.children('ol').append('<li data-slide="' + key + '">' + label + '</li>');
            });

            //  Keep a copy of the nav everywhere so we can use it
            self.$nav = $nav.insertAfter(self.$context);

            //  Now our nav is built, let's add it to the slider and bind
            //  for any click events on the generated links
            self.$nav.find('li').on('click' + self.eventSuffix, function() {
                //  Cache our link and set it to be active
                var $me = $(this).addClass(self.options.activeClass);

                //  Set the right active class, remove any other ones
                $me.siblings().removeClass(self.options.activeClass);

                //  Move the slide
                self.animate($me.attr('data-slide'));
            });
        };


        //  Set up our left-right arrow navigation
        //  (Not keyboard arrows, prev/next buttons)
        self.initArrows = function() {
            if(self.options.arrows === true) {
                self.options.arrows = self.defaults.arrows;
            }

            //  Loop our options object and bind our events
            $.each(self.options.arrows, function(key, val) {
                //  Add our arrow HTML and bind it
                self.$arrows.push(
                    $(val).insertAfter(self.$context).on('click' + self.eventSuffix, self[key])
                );
            });
        };


        //  Set up our keyboad navigation
        //  Allow binding to multiple keycodes
        self.initKeys = function() {
            if(self.options.keys === true) {
                self.options.keys = self.defaults.keys;
            }

            $(document).on('keyup' + self.eventSuffix, function(e) {
                $.each(self.options.keys, function(key, val) {
                    if(e.which === val) {
                        $.isFunction(self[key]) && self[key].call(self);
                    }
                });
            });
        };

        //  Requires jQuery.event.swipe
        //  -> stephband.info/jquery.event.swipe
        self.initSwipe = function() {
            var width = self.$slides.width();

            //  We don't want to have a tactile swipe in the slider
            //  in the fade animation, as it can cause some problems
            //  with layout, so we'll just disable it.
            if(self.options.animation !== 'fade') {

                self.$container.on({

                    movestart: function(e) {
                        //  If the movestart heads off in a upwards or downwards
                        //  direction, prevent it so that the browser scrolls normally.
                        if((e.distX > e.distY && e.distX < -e.distY) || (e.distX < e.distY && e.distX > -e.distY)) {
                            return !!e.preventDefault();
                        }

                        self.$container.css('position', 'relative');
                    },

                    move: function(e) {
                        self.$container.css('left', -(100 * self.current) + (100 * e.distX / width) + '%');
                    },

                    moveend: function(e) {
                        // Check if swiped distance is greater than threshold.
                        // If yes slide to next/prev slide. If not animate to
                        // starting point.

                        if((Math.abs(e.distX) / width) > self.options.swipeThreshold) {

                            self[e.distX < 0 ? 'next' : 'prev']();
                        }
                        else {

                            self.$container.animate({left: -(100 * self.current) + '%' }, self.options.speed / 2 );
                        }
                    }
                });
            }
        };

        //  Infinite scrolling is a massive pain in the arse
        //  so we need to create a whole bloody function to set
        //  it up. Argh.
        self.initInfinite = function() {
            var pos = ['first', 'last'];

            $.each(pos, function(index, item) {
                self.$slides.push.apply(
                    self.$slides,

                    //  Exclude all cloned slides and call .first() or .last()
                    //  depending on what `item` is.
                    self.$slides.filter(':not(".' + self._ + '-clone")')[item]()

                    //  Make a copy of it and identify it as a clone
                        .clone().addClass(self._ + '-clone')

                        //  Either insert before or after depending on whether we're
                        //  the first or last clone
                        ['insert' + (index === 0 ? 'After' : 'Before')](
                        //  Return the other element in the position array
                        //  if item = first, return "last"
                        self.$slides[pos[~~!index]]()
                    )
                );
            });
        };

        //  Remove any trace of arrows
        //  Loop our array of arrows and use jQuery to remove
        //  It'll unbind any event handlers for us
        self.destroyArrows = function() {
            $.each(self.$arrows, function(i, $arrow) {
                $arrow.remove();
            });
        };

        //  Remove any swipe events and reset the position
        self.destroySwipe = function() {
            //  We bind to 4 events, so we'll unbind those
            self.$container.off('movestart move moveend');
        };

        //  Unset the keyboard navigation
        //  Remove the handler
        self.destroyKeys = function() {
            //  Remove the event handler
            $(document).off('keyup' + self.eventSuffix);
        };

        self.setIndex = function(to) {
            if(to < 0) {
                to = self.total - 1;
            }

            self.current = Math.min(Math.max(0, to), self.total - 1);

            if(self.options.nav) {
                self.$nav.find('[data-slide="' + self.current + '"]')._active(self.options.activeClass);
            }

            self.$slides.eq(self.current)._active(self.options.activeClass);

            return self;
        };

        //  Despite the name, this doesn't do any animation - since there's
        //  now three different types of animation, we let this method delegate
        //  to the right type, keeping the name for backwards compat.
        self.animate = function(to, dir) {
            //  Animation shortcuts
            //  Instead of passing a number index, we can now
            //  use .data('unslider').animate('last');
            //  or .unslider('animate:last')
            //  to go to the very last slide
            if(to === 'first') to = 0;
            if(to === 'last') to = self.total;

            //  Don't animate if it's not a valid index
            if(isNaN(to)) {
                return self;
            }

            if(self.options.autoplay) {
                self.stop().start();
            }

            self.setIndex(to);

            //  Add a callback method to do stuff with
            self.$context.trigger(self._ + '.change', [to, self.$slides.eq(to)]);

            //  Delegate the right method - everything's named consistently
            //  so we can assume it'll be called "animate" +
            var fn = 'animate' + $._ucfirst(self.options.animation);

            //  Make sure it's a valid animation method, otherwise we'll get
            //  a load of bug reports that'll be really hard to report
            if($.isFunction(self[fn])) {
                self[fn](self.current, dir);
            }

            return self;
        };


        //  Shortcuts for animating if we don't know what the current
        //  index is (i.e back/forward)
        //  For moving forward we need to make sure we don't overshoot.
        self.next = function() {
            var target = self.current + 1;

            //  If we're at the end, we need to move back to the start
            if(target >= self.total) {
                target = 0;
            }

            return self.animate(target, 'next');
        };

        //  Previous is a bit simpler, we can just decrease the index
        //  by one and check if it's over 0.
        self.prev = function() {
            return self.animate(self.current - 1, 'prev');
        };


        //  Our default animation method, the old-school left-to-right
        //  horizontal animation
        self.animateHorizontal = function(to) {
            var prop = 'left';

            //  Add RTL support, slide the slider
            //  the other way if the site is right-to-left
            if(self.$context.attr('dir') === 'rtl') {
                prop = 'right';
            }

            if(self.options.infinite) {
                //  So then we need to hide the first slide
                self.$container.css('margin-' + prop, '-100%');
            }

            return self.slide(prop, to);
        };

        //  The same animation methods, but vertical support
        //  RTL doesn't affect the vertical direction so we
        //  can just call as is
        self.animateVertical = function(to) {
            self.options.animateHeight = true;

            //  Normal infinite CSS fix doesn't work for
            //  vertical animation so we need to manually set it
            //  with pixels. Ah well.
            if(self.options.infinite) {
                self.$container.css('margin-top', -self.$slides.outerHeight());
            }

            return self.slide('top', to);
        };

        //  Actually move the slide now
        //  We have to pass a property to animate as there's
        //  a few different directions it can now move, but it's
        //  otherwise unchanged from before.
        self.slide = function(prop, to) {
            //  If we want to change the height of the slider
            //  to match the current slide, you can set
            //  {animateHeight: true}
            self.animateHeight(to);

            //  For infinite sliding we add a dummy slide at the end and start
            //  of each slider to give the appearance of being infinite
            if(self.options.infinite) {
                var dummy;

                //  Going backwards to last slide
                if(to === self.total - 1) {
                    //  We're setting a dummy position and an actual one
                    //  the dummy is what the index looks like
                    //  (and what we'll silently update to afterwards),
                    //  and the actual is what makes it not go backwards
                    dummy = self.total - 3;
                    to = -1;
                }

                //  Going forwards to first slide
                if(to === self.total - 2) {
                    dummy = 0;
                    to = self.total - 2;
                }

                //  If it's a number we can safely set it
                if(typeof dummy === 'number') {
                    self.setIndex(dummy);

                    //  Listen for when the slide's finished transitioning so
                    //  we can silently move it into the right place and clear
                    //  this whole mess up.
                    self.$context.on(self._ + '.moved', function() {
                        if(self.current === dummy) {
                            self.$container.css(prop, -(100 * dummy) + '%').off(self._ + '.moved');
                        }
                    });
                }
            }

            //  We need to create an object to store our property in
            //  since we don't know what it'll be.
            var obj = {};

            //  Manually create it here
            obj[prop] = -(100 * to) + '%';

            //  And animate using our newly-created object
            return self._move(self.$container, obj);
        };


        //  Fade between slides rather than, uh, sliding it
        self.animateFade = function(to) {
            //  If we want to change the height of the slider
            //  to match the current slide, you can set
            //  {animateHeight: true}
            self.animateHeight(to);

            var $active = self.$slides.eq(to).addClass(self.options.activeClass);

            //  Toggle our classes
            self._move($active.siblings().removeClass(self.options.activeClass), {opacity: 0});
            self._move($active, {opacity: 1}, false);
        };

        // Animate height of slider
        self.animateHeight = function(to) {
            //  If we want to change the height of the slider
            //  to match the current slide, you can set
            //  {animateHeight: true}
            if (self.options.animateHeight) {
                self._move(self.$context, {height: self.$slides.eq(to).outerHeight()}, false);
            }
        };

        self._move = function($el, obj, callback, speed) {
            if(callback !== false) {
                callback = function() {
                    self.$context.trigger(self._ + '.moved');
                };
            }

            return $el._move(obj, speed || self.options.speed, self.options.easing, callback);
        };

        //  Allow daisy-chaining of methods
        return self.init(options);
    };

    //  Internal (but global) jQuery methods
    //  They're both just helpful types of shorthand for
    //  anything that might take too long to write out or
    //  something that might be used more than once.
    $.fn._active = function(className) {
        return this.addClass(className).siblings().removeClass(className);
    };

    //  The equivalent to PHP's ucfirst(). Take the first
    //  character of a string and make it uppercase.
    //  Simples.
    $._ucfirst = function(str) {
        //  Take our variable, run a regex on the first letter
        return (str + '').toLowerCase().replace(/^./, function(match) {
            //  And uppercase it. Simples.
            return match.toUpperCase();
        });
    };

    $.fn._move = function() {
        this.stop(true, true);
        return $.fn[$.fn.velocity ? 'velocity' : 'animate'].apply(this, arguments);
    };

    //  And set up our jQuery plugin
    $.fn.unslider = function(opts) {
        return this.each(function() {
            var $this = $(this);

            //  Allow usage of .unslider('function_name')
            //  as well as using .data('unslider') to access the
            //  main Unslider object
            if(typeof opts === 'string' && $this.data('unslider')) {
                opts = opts.split(':');

                var call = $this.data('unslider')[opts[0]];

                //  Do we have arguments to pass to the string-function?
                if($.isFunction(call)) {
                    return call.apply($this, opts[1] ? opts[1].split(',') : null);
                }
            }

            return $this.data('unslider', new $.Unslider($this, opts));
        });
    };

}));
