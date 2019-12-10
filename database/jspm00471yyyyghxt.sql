-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2019 年 12 月 02 日 15:34
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `jspm00471yyyyghxt`
--

-- --------------------------------------------------------

--
-- 表的结构 `allusers`
--

DROP TABLE IF EXISTS `allusers`;
CREATE TABLE IF NOT EXISTS `allusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL COMMENT '用户名',
  `pwd` varchar(80) NOT NULL COMMENT '密码',
  `cx` varchar(80) NOT NULL COMMENT '权限',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `allusers`
--

INSERT INTO `allusers` (`id`, `username`, `pwd`, `cx`, `addtime`) VALUES
(1, 'admin', 'admin', '超级管理员', '2019-11-29 03:20:56'),
(2, 'gr', 'gr', '普通管理员', '2019-11-29 03:20:56'),
(3, 'gg', 'gg', '普通管理员', '2019-11-29 08:18:56');

-- --------------------------------------------------------

--
-- 表的结构 `dx`
--

DROP TABLE IF EXISTS `dx`;
CREATE TABLE IF NOT EXISTS `dx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `leibie` varchar(80) NOT NULL,
  `content` longtext NOT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dx`
--

INSERT INTO `dx` (`id`, `leibie`, `content`, `addtime`) VALUES
(1, '联系我们', '<p><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); white-space: normal; font-family: 黑体; font-size: 14pt; font-weight: bold;"><br/></span></p><p><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); white-space: normal; font-family: 黑体; font-size: 14pt; font-weight: bold;"><br/></span></p><p><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); white-space: normal; font-family: 黑体; font-size: 14pt; font-weight: bold;"><br/></span></p><p><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); white-space: normal; font-family: 黑体; font-size: 14pt; font-weight: bold;">微信公众平台：</span><span style="color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"></span></p><div style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 18.6667px; font-weight: bold;"><img src="http://www.cqsfybjy.com/upfiles/201702/20170228090014244.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; color: rgb(0, 0, 0); font-size: 18.6667px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: normal; widows: 1;"/><br/></span><div style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em; font-weight: bold;">新浪官方微博：</span></div><div style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em; font-weight: bold;"><img src="http://www.cqsfybjy.com/upfiles/201702/20170228090034176.png" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial;"/><br/></span></div><div style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em;"><span style="margin: 0px; padding: 0px; font-weight: bold;">官方网站：</span>www.cqsfybjy.com</span></div><div style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em;">或百度直接搜索“重庆市妇幼保健院”</span></div><div style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em; font-weight: bold; color: rgb(255, 0, 0);">24小时医疗咨询电话：023-63702844/63703054</span></div><div style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em; font-weight: bold;">医院公共邮箱：</span><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em;">cqsfybjy@sina.com</span></div><div style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em; font-weight: bold;">人事招聘邮箱：</span><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em;">cqfyrsf@sina.com</span></div><div style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em; font-weight: bold;">冉家坝院区：</span><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em;">渝北区龙山路120号 &nbsp;</span><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em; font-weight: bold;">&nbsp;七星岗院区：</span><span style="margin: 0px; padding: 0px; font-family: 黑体; font-size: 14pt; line-height: 2; text-align: justify; text-indent: 2em;">渝中区金汤街64号</span></div></div><p><br/></p><p><br/></p><p><br/></p>', '2019-11-29 08:24:28');

-- --------------------------------------------------------

--
-- 表的结构 `jiuzhenjieguo`
--

DROP TABLE IF EXISTS `jiuzhenjieguo`;
CREATE TABLE IF NOT EXISTS `jiuzhenjieguo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yuyueguahaoid` int(10) unsigned NOT NULL COMMENT '预约挂号id',
  `suoshukeshi` varchar(255) NOT NULL COMMENT '所属科室',
  `yuyueren` varchar(50) NOT NULL COMMENT '预约人',
  `zhenduanjieguo` text NOT NULL COMMENT '诊断结果',
  `chufang` longtext NOT NULL COMMENT '处方',
  `yiliaofeiyong` decimal(10,2) NOT NULL COMMENT '医疗费用',
  `kanzhenren` varchar(50) NOT NULL COMMENT '看诊人',
  `iszf` varchar(10) NOT NULL DEFAULT '否',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `jiuzhenjieguo`
--

INSERT INTO `jiuzhenjieguo` (`id`, `yuyueguahaoid`, `suoshukeshi`, `yuyueren`, `zhenduanjieguo`, `chufang`, `yiliaofeiyong`, `kanzhenren`, `iszf`, `addtime`) VALUES
(2, 1, '1', '张小明', '暂时还死不了', '<p style="text-align: center;"><img src="upload/20191129/36341575014863502.png"/></p>', '888.00', '002', '是', '2019-11-29 08:07:53'),
(3, 2, '9', '朱小明', '还死不了，暂时！！！', '<p><img src="upload/20191129/18531575016119340.png"/></p>', '1889.98', '008', '是', '2019-11-29 08:28:49');

-- --------------------------------------------------------

--
-- 表的结构 `keshifenlei`
--

DROP TABLE IF EXISTS `keshifenlei`;
CREATE TABLE IF NOT EXISTS `keshifenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(50) NOT NULL COMMENT '分类名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `keshifenlei`
--

INSERT INTO `keshifenlei` (`id`, `fenleimingcheng`, `addtime`) VALUES
(1, '门诊部', '2019-11-29 03:35:33'),
(2, '住院部', '2019-11-29 03:35:40'),
(3, '急诊部', '2019-11-29 03:35:47'),
(4, '放射科', '2019-11-29 03:35:58'),
(5, 'B超室', '2019-11-29 03:36:04');

-- --------------------------------------------------------

--
-- 表的结构 `keshixinxi`
--

DROP TABLE IF EXISTS `keshixinxi`;
CREATE TABLE IF NOT EXISTS `keshixinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keshibianhao` varchar(50) NOT NULL COMMENT '科室编号',
  `mingcheng` varchar(50) NOT NULL COMMENT '名称',
  `fenlei` varchar(255) NOT NULL COMMENT '分类',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `jianjie` text NOT NULL COMMENT '简介',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `keshixinxi`
--

INSERT INTO `keshixinxi` (`id`, `keshibianhao`, `mingcheng`, `fenlei`, `tupian`, `jianjie`, `addtime`) VALUES
(1, '11291136121778', '内科', '1', 'upload/1574998629245.png', '内科 （医学专业） 编辑\r\n医学科属。包括呼吸内科，消化内科，心血管内科，神经内科，肿瘤科，内分泌科，血液内科，传染病科，小儿内科等。呼吸内科：包括的疾病有感冒、肺炎、肺气肿、肺结核、支气管扩张、哮喘、肺癌、肺心病、呼吸衰竭、慢性支气管炎、气胸、肺脓肿、胸腔积液、间质性肺疾病。\r\n2017年12月1日，《公共服务领域英文译写规范》正式实施，规定内科标准英文名为Internal Medicine Department。\r\n内科学是临床医学的一个专科，几乎是所有其他临床医学的基础，亦有医学之母之称。\r\n红十字\r\n红十字\r\n内科学的内容包含了疾病的定义、病因、致病机转、流行病学、自然史、症状、征候、实验诊断、影像检查、鉴别诊断、诊断、治疗、预后。内科学的方法是透过病史询问或面谈后，进行理学检查，根据病史与检查所见做实验诊断与影像检查，以期在众多鉴别诊断中排除可能性较低者，获得最有可能的诊断；获得诊断后，内科的治疗方法包含追踪观察、生活方式、药物、介入性治疗（如心导管、内视镜）等，根据病人的状况调整药物之使用，防止并处理副作用及并发症。\r\n内科学在临床医学中占有极其重要的位置，它不仅是临床医学各科的基础，而且与它们存在着密切的联系。内科学的知识来源于医疗实践，以前的医学家在治病救人的过程中，经过不断的积累经验，去伪存真、去粗采精，从实践中不断提高认识水平，通过多年的长期积累，逐渐形成有系统的诊治疾病的方法。经过一代又一代的医学家将这些实践得来的知识，经过整理和归纳。并加以系统地研究(包括循证医学的研究)，才发展为内科学。一个优秀的临床医生，不但要有为人民服务的心愿，还要有为人民服务的本领。要获得治病的本领，既要善于读书，又要勤于实践，并在实践中不断地总结经验和教训，如此多年的深研苦钻，才能成材。\r\n内科的检查意义：用于了解胸部、心肺听诊、肠鸣音、心率、杂音、心律、肝、脾腹壁静脉曲张等情况。\r\n内科一般分为：心内科、神经内科(头痛面瘫 瘫痪昏迷 抽搐眩晕 肌肉萎缩不自主运动)、呼吸内科(发热 咳嗽咯血 呼吸困难呃逆)、消化内科、肾内科、内分泌科(水肿 生长发育异常尿量异常 尿糖甲状腺肿大)、风湿病科、血液科、肝科、传染科、耳鼻咽喉科、小儿内科。', '2019-11-29 03:38:22'),
(2, '11291138351987', '外科', '1', 'upload/1574998849135.png', '在巫文化（或迷信中）广泛的是指“鬼神附体”或受其影响而产生的一种疾病，这是相对于疾病的一种通俗的称呼。别称“外讲”等。\r\n在科技不发达原始社会时，由于人类所认识的知识比较少，对这个社会中出现的某些状况不了解，把自然界的打雷、闪电、下雨、火山喷发、地震等现象误以为是某个神仙在发怒，整天诚惶诚恐，怕天神一个不爽就降灾患于身上，就如同疾病、瘟疫等。\r\n当人们疾病降身的时候就会认为是“鬼神附体”或受其影响而产生的疾病，由于有些疾病现代科学还不能很好的治疗，人们就会在封建迷信中求得内心的安慰，巫师就会说是“外科”疾病，这个所谓的“外科”是相对于现代医学的一种通俗的说法。\r\n“外科”又叫“外讲”，因为这种疾病的根源不是人本身的原因造成的，是外部原因。', '2019-11-29 03:41:32'),
(3, '11291141341416', '儿科', '1', 'upload/1574998971128.png', '儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治的对象处于生长发育期。 [1] \r\n儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童和青少年体质，提高儿童青少年保健和疾病防治水平。 [1] \r\n世界各国的儿科范围年龄各有不同，自婴儿期至青少年期为儿科范围。', '2019-11-29 03:43:04'),
(4, '11291143053928', '妇科', '1', 'upload/1574999105022.png', '妇科是医疗机构的一个诊疗科目，妇科是妇产科的一个分支专业，是以诊疗女性妇科病为诊疗的专业科室，分为西医妇科与中医妇科。妇科疾病包括：女性生殖系统的疾病即为妇科疾病，包括外阴疾病、阴道疾病、子宫疾病、输卵管疾病、卵巢疾病等\r\n⒈ 医学中以妇女病为研究对象的科目，如：妇科学。\r\n⒉ 指医院中专治妇女病的一个科室。\r\n女性生殖系统所患的疾病才叫妇科疾病。妇科疾病的种类可分很多种，常见的有：子宫肌瘤、卵巢囊肿、阴道炎、宫颈炎、宫颈糜烂、盆腔炎、附件炎、功能性子宫出血、乳腺疾病、不孕症、月经不调、子宫内膜炎、白带异常等等。女性从青年期开始，就应该懂得月经、生育、妊娠、分娩、绝经等一些基本的医学常识，并经常保持乐观的情绪，这样就能避免或减少某些妇产科疾病的发生。\r\n', '2019-11-29 03:45:18'),
(5, '11291145191070', '耳鼻咽喉科', '1', 'upload/1574999149976.png', '“耳鼻咽喉科”是诊断治疗耳、鼻、咽、喉、及其相关头颈区域的外科学科。随着科技的进步与发展，医学各科相互渗透和促进，拓展了耳鼻咽喉科的范畴，耳显微外科，耳神经外科，侧颅底外科，听力学及平衡科学，鼻内镜外科，鼻神经外科（鼻颅底外科），头颈外科，喉显微外科，嗓音与言语疾病科，小儿耳鼻咽喉科等的出现，大大丰富了耳鼻咽喉科的内容。', '2019-11-29 03:46:23'),
(6, '11291146311667', 'CT室', '4', 'upload/1574999231451.png', 'CT(Computed Tomography)，即电子计算机断层扫描，它是利用精确准直的X线束、γ射线、超声波等，与灵敏度极高的探测器一同围绕人体的某一部位作一个接一个的断面扫描，具有扫描时间快，图像清晰等特点，可用于多种疾病的检查；根据所采用的射线不同可分为：X射线CT（X-CT）以及γ射线CT（γ-CT)等。', '2019-11-29 03:48:16'),
(7, '11291148172861', '磁共振室', '4', 'upload/1574999385740.png', '磁共振检查〔Magnetic Resonance,MR〕是医学检查的一种方法，也是医学影像学的一场革命，生物体组织能被电磁波谱中的短波成分如X线等穿透，但能阻挡中波成分如紫外线、红外线及长波。\r\n人体组织允许磁共振产生的长波成分如无线电波穿过，这是磁共振应用于临床的基本条件之一。', '2019-11-29 03:49:46'),
(8, '11291149511966', '腹部B超室', '5', 'upload/1574999551356.png', '人们在说话或唱歌的时候，我们听到的声音称为声波，它的频率在50~10000Hz，超过20000Hz以上的声波，人耳就不能听见，称为超声波，简称超声。超声在诊断疾病时，有多种形式：①以振幅（ amplitude）形式诊断疾病的称“一维显示” , 因振幅第一个英文字母是A，故称A超，又称一维超声。②以灰阶即亮度（brightness）模式形式来诊断疾病的称“二维显示”，因亮度第一个英文字母是B，故称B超，又称二维超声或灰阶超声。', '2019-11-29 03:53:12'),
(9, '11291620187194', '男科', '1', 'upload/1575015657980.png', '男科学是指男子生殖系统的生理、病理变化的一门综合学科。中医男科学是运用中医药理论认识和研究男性生理、病理、养生、优生及男性特有疾病的发生、发展、转归、诊疗和护理、保健等规律的中医临床学科。具有科学性和先进性的中医男科学，是门古老且新兴的学科，与中医妇科学相对应，都是祖国传统医学中的重要组成部分。 ', '2019-11-29 08:21:25');

-- --------------------------------------------------------

--
-- 表的结构 `lunbotu`
--

DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE IF NOT EXISTS `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '连接地址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `lunbotu`
--

INSERT INTO `lunbotu` (`id`, `title`, `image`, `url`, `addtime`) VALUES
(1, '1', 'upload/1575001453545.png', '#', '2019-11-29 04:24:15'),
(2, '2', 'upload/1575001517966.png', '#', '2019-11-29 04:25:19'),
(3, '4', 'upload/1575015858343.png', '#', '2019-11-29 08:24:20');

-- --------------------------------------------------------

--
-- 表的结构 `pinglun`
--

DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE IF NOT EXISTS `pinglun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wenzhangID` int(10) unsigned NOT NULL,
  `pinglunneirong` text NOT NULL,
  `pinglunren` varchar(80) NOT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `biao` varchar(255) NOT NULL,
  `pingfen` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `shoucangjilu`
--

DROP TABLE IF EXISTS `shoucangjilu`;
CREATE TABLE IF NOT EXISTS `shoucangjilu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `xwid` int(10) unsigned NOT NULL,
  `biao` varchar(255) NOT NULL,
  `biaoti` varchar(255) NOT NULL,
  `url` varchar(512) NOT NULL,
  `ziduan` varchar(255) NOT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinwenfenlei`
--

DROP TABLE IF EXISTS `xinwenfenlei`;
CREATE TABLE IF NOT EXISTS `xinwenfenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(50) NOT NULL COMMENT '分类名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xinwenfenlei`
--

INSERT INTO `xinwenfenlei` (`id`, `fenleimingcheng`, `addtime`) VALUES
(1, '医院公告', '2019-11-29 04:00:38'),
(2, '医院动态', '2019-11-29 03:53:54');

-- --------------------------------------------------------

--
-- 表的结构 `xinwenxinxi`
--

DROP TABLE IF EXISTS `xinwenxinxi`;
CREATE TABLE IF NOT EXISTS `xinwenxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `fenlei` varchar(255) NOT NULL COMMENT '分类',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `tianjiaren` varchar(50) NOT NULL COMMENT '添加人',
  `dianjishuai` int(11) NOT NULL COMMENT '点击率',
  `neirong` longtext NOT NULL COMMENT '内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `xinwenxinxi`
--

INSERT INTO `xinwenxinxi` (`id`, `biaoti`, `fenlei`, `tupian`, `tianjiaren`, `dianjishuai`, `neirong`, `addtime`) VALUES
(1, '总结经验教训 提高救治水平——重庆市2019年新生儿出生窒息死亡专题评审会顺利召开', '2', 'upload/1574999870516.png', 'admin', 0, '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 15pt;">为提高辖区医疗机构危重新生儿救治技术水平，及时发现新生儿死亡过程中存在的问题，不断规范技术服务，有效降低新生儿出生窒息死亡率。受重庆市卫生健康委员会委托，重庆市妇幼保健院于2019年11月21日召开了重庆市2019年新生儿出生窒息死亡专题评审会。重庆市卫生健康委员会妇幼健康服务处副处长唐旭艳出席。来自全市各区县卫生健康委相关负责人、妇幼保健院工作管理人员、新生儿死亡评审产/儿科专家等共计220余人参会。市妇幼保健院新生儿科主任钟晓云主持会议。</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 15pt;"></span><img src="./upload/1574999878343.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 450px;"/><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp; 为规范辖区新生儿死亡评审会，提高辖区危重新生儿救治能力，此次评审会特别邀请市级危重孕产妇和危重新生儿救治中心相关产科、新生儿科、护理三方面的9位专家作为主评专家或副评专家，对5例新生儿出生窒息死亡病例进行了专题评审。</span><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp; 会前，唐旭艳强调，母婴安全的重要意义，特别强调了评审会公平公正与保密原则，还向各参会人员提出三点要求：一是要求规范开展死亡评审工作，不断总结经验，提高救治水平；二是要求加强新生儿复苏培训，熟练掌握新生儿急救知识；三是要求重视危重新生儿救治管理，加强危重新生儿救治中心建设。</span><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp; 会上，经治医生首先介绍了死亡病例的病史情况，市级评审专家紧接对每例病例从孕期、产期和新生儿期的相关救治方面进行了专业性分析与现场点评，明确了死亡诊断和根本死因，找出了影响新生儿死亡的相关因素，并根据发现的问题提出了针对性改进措施。参会人员也积极参与其中，根据病例讨论情况提出疑问，专家们给予一一解答。</span><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp; 最后，钟晓云针对本次评审会进行了总结，对参会医疗机构强调在今后工作中须注意以下八点：一是加强产程监测；二是及时宫内转运；三是加强产儿科沟通；四是医患沟通要有针对性；五是完善设施设备，重视体温监测与血气分析等；六是强化新生儿复苏培训，尤其是气管插管、急救用药等；七是规范抢救与护理记录；八是重视死亡原因证据收集。并根据此次评审过程中发现的问题，进行了新生儿复苏相关知识培训，细致地讲解了新生儿复苏的最新指南、新生儿出生时生理变化与抢救注意事项。</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1574999884937.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 305px;"/><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp; 此次会议的顺利召开，提出了降低新生儿死亡率的有效举措，切实提高了我市新生儿救治水平，为今后医护人员对新生儿早期风险的评估与出生窒息的救治措施打下强力的基础。</span></span></p><p><br/></p>', '2019-11-29 03:58:08'),
(2, '以演促学 以学促练 以练促战——重庆市妇幼保健院开展医院感染暴发应急演练', '2', 'upload/1574999910414.png', 'admin', 0, '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;">为持续强化医务人员院感安全防控意识，进一步提高医院感染暴发应急处置能力，2019年11月21日下午，由院党委委员、副院长但阳指挥，医院感染控制科牵头，产科病房、医务科、护理部、药剂科、检验科、重症医学科及医管家等多部门配合，在产科病房六病区开展了多重耐药菌医院感染暴发应急演练。</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;"></span><img src="./upload/1574999918529.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 600px;"/><br/><span style="margin: 0px; padding: 0px; font-size: 16pt;">&nbsp;&nbsp; 此次演练，场景逼真，角色分工明确，从演练预案的脚本设计、人员培训、物资准备、预演练到演练，均以“贴近临床、贴近实际”为准则。演练中，从产科病房病例监测与报告、相关部门积极应急响应、但阳组织专家会诊讨论、现场流行病学调查到完善疾病诊断血培养检查等，各部门各司其职，密切配合，有序应对，达到了预期效果。</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1574999920194.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 600px;"/><br/><span style="margin: 0px; padding: 0px; font-size: 16pt;">&nbsp;&nbsp; 最后，但阳在总结时强调，医务人员要强化院感意识，严格遵守操作规范，抓好常态监测，及时抑止苗头，重在长效预防。通过此次演练，进一步提高了医务人员对医院感染暴发的识别能力，为扎实开展医疗工作、建立预警机制、提高应急处置能力奠定了基础。</span></span></p><p><br/></p>', '2019-11-29 03:58:41'),
(3, '围产医学中心建设标准发布', '2', 'upload/1574999940763.png', 'admin', 1, '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;">为进一步促进围产医学学科建设，提高围产医疗技术水平，特别是保障新生儿的健康，重庆市妇幼保健院借鉴德国围产医学中心建设标准，结合中国《危重孕产妇救治中心建设与管理指南》《危重新生儿救治中心建设与管理指南》等规定，制定了《围产医学中心建设标准》。围产医学中心设置分为“Ⅰ级围产医学中心”、“Ⅱ级围产医学中心”和“Ⅲ级围产医学中心”，供各医疗机构建设围产医学中心时参考。</span><br/><span style="margin: 0px; padding: 0px; font-size: 16pt;">希望通过本建设标准的提出及推广，不断丰富并完善其内涵，持续提升重庆乃至国内围产医学发展水平，通过标准化围产医学中心的建设及运行，充分保障早产儿及危重新生儿的围产一体化救治能力，持续降低我国的孕产妇及新生儿死亡率，助力“健康中国”建设。</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1574999951519.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 400px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1574999952521.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 487px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1574999952842.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 487px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1574999953098.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 487px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1574999953492.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 487px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1574999953709.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 486px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1574999954031.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 487px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1574999954248.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 487px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1574999954531.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 487px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1574999954958.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 487px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1574999955361.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 487px;"/></p><p><br/></p>', '2019-11-29 03:59:15'),
(4, '第二届“长江-莱茵河”新生儿围产期医学论坛顺利召开', '2', 'upload/1574999965913.png', 'admin', 6, '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;">2019年10月10日，由重庆市妇幼保健院举办的第二届“长江-莱茵河”新生儿围产期医学论坛成功召开。来自德国马格德堡大学儿童医院Jorch教授、德国莱比锡大学儿童医院Thome教授、德国哥廷根大学儿童医院Küster教授、美国宾夕法尼亚大学费城儿童医院张华岩教授，及浙江大学医学院附属儿童医院杜立中教授、复旦大学附属儿科医院周文浩教授等国内外20余名著名新生儿专家和200余名学员参加了会议。重庆市卫生健康委员会党委委员、副主任周林、妇幼健康处副处长唐旭艳、国际合作处副处长杨彬及重庆市妇幼保健院在家院领导出席开幕式。</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1574999974943.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 400px;"/></span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1574999976399.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 367px;"/><br/><span style="margin: 0px; padding: 0px; font-size: 16pt;color:#ff0000;margin: 0px; padding: 0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ↑重庆市卫生健康委员会党委委员、副主任周林</span></span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1574999976998.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 400px;"/><span style="color:#ff0000;margin: 0px; padding: 0px;"><br/><span style="margin: 0px; padding: 0px; font-size: 16pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ↑重庆市妇幼保健院党委副书记、院长张华</span></span></span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1574999977501.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 400px;"/><br/><span style="margin: 0px; padding: 0px; font-size: 16pt;color:#ff0000;margin: 0px; padding: 0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;↑德国马格德堡大学儿童医院教授Jorch</span><br/><span style="margin: 0px; padding: 0px; font-size: 16pt;">&nbsp; 开幕式上，周林代表市卫生健康委对会议的召开表示热烈祝贺，并对重庆市妇幼保健院中德合作围产医学中心建设给予了充分的肯定。同时，要求医院要充分利用好中德国际合作交流平台，勇于创新、大胆实践，大幅度提升重庆乃至西部地区围产医学专业技术水平，助力健康中国建设。随后，张华代表医院致欢迎辞，他表示，经过近两年的努力，目前围产医学中心雏形已成。医院将继续深入开展中德合作，持续提升早产儿及危重新生儿的围产一体化救治能力，为促进妇女儿童健康水平做出新的更大的贡献。</span></span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1574999977756.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 347px;"/><br/><span style="margin: 0px; padding: 0px; font-size: 16pt;">&nbsp; 最后，由重庆市妇幼保健院制定的“长莱”会议围产医学中心标准在开幕式上正式发布，这是中德合作的结晶，也是围产医学中心建设的新的起点。</span></span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;"><img src="./upload/1574999978525.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 400px;"/></span></span></span></p><p><br/></p>', '2019-11-29 03:59:39'),
(5, '2019年重庆市妇幼保健院第三届“世界早产儿日”活动顺利举办', '2', 'upload/1575000008559.png', 'admin', 2, '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 16pt;">据世界卫生组织报道，全球每年有1500万早产儿出生，同期有超过100万早产儿死于早产相关并发症。“早产儿”这一社会问题受到了全球越来越多的关注和重视，并将每年的11月17日设立为“世界早产儿日”。为了呼吁社会更多地关注早产儿，不断提升早产儿生存质量，重庆市妇幼保健院新生儿科于2019年11月16日举办了“世界早产儿日---常回家看看”主题活动。院长张华代表医院为此次活动致辞，热烈欢迎早产宝宝们“回家”，介绍了围产医学中心成立以来，市妇幼保健院早产儿救治率取得了非凡的技术进步，为万千早产儿家庭带来了福音。</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1575000023265.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 369px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1575000031508.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 377px;"/><br/><span style="margin: 0px; padding: 0px; font-size: 16pt;">&nbsp;&nbsp; 活动当天，24名曾经在重庆市妇幼保健院新生儿科住院治疗的早产宝宝回到医院，与医护“妈妈”们重聚，昔日在暖箱里治疗的稚嫩的小天使们已经出落成了帅气的小王子和美丽的小公主。爸爸妈妈们分享了宝宝成长的经历，讲述了他们在成长路上遇到的重重难关，对新生儿科医护人员的精心治疗和护理表示了衷心的感谢。活动现场宝贝儿们进行了精彩的才艺表演。在医护人员的陪同下参观了新生儿重症监护病房−他们曾经的“家”。最后，所有参加活动的早产宝宝在门诊大厅共同绘制一幅画。现场宝贝的欢声笑语、父母和医护人员的热情交流交织成了一首首和谐的乐章。</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1575000035216.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 411px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1575000038244.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 373px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1575000043419.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 399px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1575000047656.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 399px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1575000051005.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 394px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1575000055064.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 399px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1575000059256.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 431px;"/><br/><span style="margin: 0px; padding: 0px; font-size: 16pt;">&nbsp;&nbsp; 活动结束后，儿科门诊、儿童保健科、眼耳鼻喉科等科室医护人员还为宝宝们进行了免费的体格测量、智力测评等检查，并现场为家长们答疑解惑。家长们都表示本次活动意义非凡，希望有机会常回家看看。</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><img src="./upload/1575000064238.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 407px;"/><br/><span style="margin: 0px; padding: 0px; font-size: 16pt;">&nbsp;&nbsp; 近年来随着我国二孩政策的开放，孕母年龄的增大，早产儿的出生数量日益增多。“少年强，则国强”！希望社会能够更多地关注和关爱早产宝宝，在医院围产医学中心的不断努力下，在家长们的坚持和全社会的共同关心下，早产宝宝们都能够健康、快乐的成长！</span></span></p><p><br/></p>', '2019-11-29 04:01:09'),
(6, '关于2019年下半年公开考核招聘面试资格复审的通知', '1', 'upload/1575000090432.png', 'admin', 1, '<p><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-size: 14px; white-space: normal;"><span style="margin: 0px; padding: 0px; font-size: 15pt;"><strong style="margin: 0px; padding: 0px;">参加我院公开考核招聘面试资格复审的考生：</strong></span><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp; 请务必于2019年11月21日（上午8:30-12:00，下午2:00-5:00），到重庆市妇幼保健院冉家坝院区行政楼四楼人事科参加公招面试资格复审，过期未报到者视为自动放弃。考生资格复审需持以下相关证件及材料（包括原件和复印件）：</span><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp; 1、本人自荐书、身份证、毕业证(其中：非应届毕业生同时还需提供学信网上的《教育部学历证书电子注册备案表》；应届毕业生需提供学校出具的《就业推荐表》)、学位证、执业资格证、职称证等。</span><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp; 2、报名时相应岗位所要求的“其它条件”栏中所需的证件及材料。</span><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp; 3、属机关事业单位正式工作人员的考生，需提供所在单位出具的《同意（诚信）报考事项》纸质原件（盖单位公章），其具体格式和要求必须按照市人社局下发的模版为标准（见附件）。</span><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp;&nbsp;4、已辞职考生，需提供与原单位解除劳动关系的书面正式文件或证明材料（纸质原件，盖单位公章）。</span><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp; 5、有工作经历要求的岗位，需提供本人劳动合同、养老保险个人帐户信息、工资发放表三者之一和单位证明材料。<br/>&nbsp; &nbsp;6、出示英语和计算机等级证书，但不作为必备要求。&nbsp;</span></span><span style="color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"></span></p><div style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><span style="font-family:仿宋,仿宋_GB2312;margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 20px;"><br/></span><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp;&nbsp;<strong style="margin: 0px; padding: 0px;">特别提醒：面试资格复审合格者，可参加我院公开考核招聘面试（时间待定），面试成绩不合格者，不进入试岗环节。</strong></span><br/><span style="margin: 0px; padding: 0px; font-size: 15pt;">&nbsp;&nbsp; 请参加面试资格复审的考生看到此通知后，务必尽快回复重庆市妇幼保健院人事科，电话：023-63846904，电子邮箱：<a href="http://undefined" style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-size: 12px;">cqfyrsk@sina.com</a>&nbsp;(通过电子邮箱回复的，请注明：本人姓名、身份证号和报考岗位，是否参加面试资格复审）。谢谢！</span></span></div><p><br/></p>', '2019-11-29 04:01:34'),
(7, '一张电子就诊卡搞定市妇幼就医全流程', '1', 'upload/1575000131187.png', 'admin', 0, '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1575000148101.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 315px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1575000149261.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 3956px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; text-indent: 32px; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"><img src="./upload/1575000156258.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; width: 600px; height: 2209px;"/></p><p><br/></p>', '2019-11-29 04:02:39'),
(8, '2019年度上半年公开考核招聘成绩及进入体检人员公示', '1', 'upload/1575000217686.png', 'admin', 2, '<p><strong style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 仿宋, 仿宋_GB2312; font-size: 21.3333px; text-indent: 32px; white-space: normal;"><span style="margin: 0px; padding: 0px; font-size: 16pt;">各位考生：</span><br/></strong><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 仿宋, 仿宋_GB2312; font-size: 16pt; text-indent: 32px; white-space: normal;"><strong style="margin: 0px; padding: 0px;">&nbsp;&nbsp;&nbsp;</strong>根据《重庆市2019年上半年公开招（选）聘市属事业单位工作人员公告》，我院已完成2019年上半年事业单位公开考核招聘工作，参加考核招聘的岗位有：妇产科医师2、麻醉医师。</span><br/><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 仿宋, 仿宋_GB2312; font-size: 16pt; text-indent: 32px; white-space: normal;">&nbsp;&nbsp; 经过面试和试岗等考核程序，只有部份考生进入体检环节（详见附表）。</span><br/><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 仿宋, 仿宋_GB2312; font-size: 16pt; text-indent: 32px; white-space: normal;">&nbsp;&nbsp; 未进入体检的考生，非常感谢你们对我院的信任，希望今后继续关注我院。</span><br/><br/><br/><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 仿宋, 仿宋_GB2312; font-size: 16pt; text-indent: 32px; white-space: normal;">附：重庆市妇幼保健院2019年度上半年公开考核招聘成绩及参加体检人员公布表</span><br/><br/><br/><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 仿宋, 仿宋_GB2312; font-size: 16pt; text-indent: 32px; white-space: normal;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 妇幼保健院</span><br/><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 仿宋, 仿宋_GB2312; font-size: 16pt; text-indent: 32px; white-space: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;2019年11月24日</span></p>', '2019-11-29 04:03:52'),
(9, '招贤纳士 职等你来', '1', 'upload/1575000355338.png', 'admin', 2, '<p><img src="./upload/1575000274132.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"/><img src="./upload/1575000279587.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"/><img src="./upload/1575000287658.jpg" style="margin: 0px; padding: 0px; border-width: initial; border-color: initial; border-image: initial; color: rgb(51, 51, 51); font-family: 宋体, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal;"/></p>', '2019-11-29 04:06:01'),
(10, '关于调整医院车库进出口的通知', '1', 'upload/1575000326165.png', 'admin', 4, '<p><img src="./upload/1575000329052.jpg"/></p>', '2019-11-29 04:05:33'),
(11, '测试', '2', 'upload/1575015812393.png', 'admin', 1, '<p>测试</p>', '2019-11-29 08:23:34');

-- --------------------------------------------------------

--
-- 表的结构 `yisheng`
--

DROP TABLE IF EXISTS `yisheng`;
CREATE TABLE IF NOT EXISTS `yisheng` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gonghao` varchar(50) NOT NULL COMMENT '工号',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `suoshukeshi` varchar(255) NOT NULL COMMENT '所属科室',
  `xingbie` varchar(255) NOT NULL COMMENT '性别',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `zhaopian` varchar(255) NOT NULL COMMENT '照片',
  `guahaofei` decimal(10,2) NOT NULL COMMENT '挂号费',
  `jianjie` text NOT NULL COMMENT '简介',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `yisheng`
--

INSERT INTO `yisheng` (`id`, `gonghao`, `mima`, `xingming`, `suoshukeshi`, `xingbie`, `lianxidianhua`, `zhaopian`, `guahaofei`, `jianjie`, `addtime`) VALUES
(1, '001', '000', '曾友元', '1', '男', '13800138000', 'upload/1575010056830.png', '30.00', '曾友元，男，社康中心，硕士研究生毕业，副主任医师。1985年毕业于衡阳医学院医疗系，1996年毕业于暨南大学研究生院，研究方向：肾脏疾病。深圳市肾脏病专业委员会委员，深圳市中西医结合肾脏病专业委员会委员，中华肾脏病学会会员。经过八年正规医学理论学习有扎实的医学专业知识，有二十余年的临床实践经验。对儿科疾病有丰富经验，掌握肾穿活检、血液透析技术，对难治性肾病综合症有精确的用药经验。在国家级、省级医学专业刊物发表论文十余篇。', '2019-11-29 06:50:02'),
(2, '002', '000', '王萍', '1', '女', '13800138000', 'upload/1575010255923.png', '30.00', '王萍，女，肾内科副主任医师，医学硕士。擅长急慢性肾小球肾炎、肾小管间质疾病、肾病综合征、尿路感染、急慢性肾衰竭、狼疮性肾炎、糖尿病肾病等的诊断及治疗，在腹膜透析、血液净化方面积累了丰富的临床经验，对肾活检病理及肾移植有一定研究。在风湿关节疾病的方面，积累了比较丰富的临床经验。发表医学论文7篇，参与省级科研课题1项。', '2019-11-29 06:51:01'),
(3, '003', '000', '骆子义', '1', '男', '13800138000', 'upload/1575010389414.png', '30.00', '长期在省级医院从事传染病临床工作，及消化内科，主持消化内窥镜室工作，对消化内科的诊断治疗经验丰富。', '2019-11-29 06:53:19'),
(4, '004', '000', '叶曲扬', '4', '女', '13800138000', 'upload/1575010478561.png', '30.00', '叶曲扬，女，1979年毕业于中山医学院。从事妇产科临床及妇幼保健工作27年，擅长宫颈病变、不孕症、盆腔疼痛、慢性盆腔炎症、内分泌疾病等妇科常见病、多发病的诊断及治疗；在产前孕期保健、高危妊娠、产后指导等孕产妇管理方面具有丰富的经验。在国家级、省级刊物发表论文7篇。', '2019-11-29 06:54:41'),
(5, '005', '000', '夏文艳', '4', '女', '13800138000', 'upload/1575010520601.png', '30.00', '夏文艳，女，一九八三年吉林医学院医疗系本科毕业，学士学位。在三甲医院从事临床工作二十年。擅长妇科良、恶性肿瘤的手术治疗及术后化疗。一九九八年开展恶性肿瘤根治手术，同时行术后腹腔化疗及动脉插管介入化疗，所主持科研项目“超选择性髂内动脉插管化疗治疗卵巢恶性肿瘤”获市级科技进步奖。有近十年宫腔镜诊治经验。在妇科内分泌、不孕症及高危妊娠诊治方面有丰富经验。在吉林地区业务技术竞赛中两次获“技术能手”称号。国家级、省级专业刊物发表论文十二篇。', '2019-11-29 06:55:24'),
(6, '006', '000', '刘绪光', '5', '男', '13800138000', 'upload/1575010615501.png', '30.00', '刘绪光男在三甲医院韶关市粤北人民医院从事合作专科工作年青十多年曾任科主任成功并荣获“十佳职工”称号在从医实践中青中曾到湖南湘雅医科知名大学进修学习关节炎先后参加科研了造诣全国性的鼻窦内窥镜和耳显微技术进展等多个学习班熟练掌握耳鼻咽喉毕业疾病的诊断先后和治疗小组方法“突发性耳聋患者的局部脑血流断层显像研究”“食管充气实验在喉癌术后二期发音重建中的实用性研究”获韶关市科技进步奖', '2019-11-29 06:56:58'),
(7, '007', '000', '曾蓉', '5', '女', '13800138000', 'upload/1575010622358.png', '30.00', '曾蓉女年本科课题毕业医疗现为深圳市问题医学会第四届耳鼻咽喉科专业广州委员会委员深圳市劳动能力鉴定委员会参加专家库成员从事知识耳鼻咽喉科现任临床发现工作年有多年“三甲”医院突出临床及主任教学经验核心曾在南方医院进修熟练掌握常见多发病的诊断科室和治疗经验技能擅长过敏性鼻炎的综合先后造诣治疗对疑难多种少见病有一定的研究有多篇引用医学论文组织在国家地区级和省级卫生杂志上发表擅长四川科研省教委科研从事课题紧密“C-jun在豚鼠过敏性鼻炎中的表达”获阶段性成果中青', '2019-11-29 06:57:26'),
(8, '008', '000', '张医生', '9', '男', '13800138000', 'upload/1575015737197.png', '30.00', '张医生，男，曾获奖......  ', '2019-11-29 08:23:02');

-- --------------------------------------------------------

--
-- 表的结构 `youqinglianjie`
--

DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE IF NOT EXISTS `youqinglianjie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) NOT NULL COMMENT '网站名称',
  `wangzhi` varchar(50) NOT NULL COMMENT '网址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `youqinglianjie`
--

INSERT INTO `youqinglianjie` (`id`, `wangzhanmingcheng`, `wangzhi`, `addtime`) VALUES
(1, '百度', 'http://www.baidu.com', '2019-11-29 03:20:56'),
(2, '谷歌', 'http://www.google.cn', '2019-11-29 03:20:56'),
(3, '新浪', 'http://www.sina.com', '2019-11-29 03:20:56'),
(4, 'QQ', 'http://www.qq.com', '2019-11-29 03:20:56'),
(5, '网易', 'http://www.163.com', '2019-11-29 03:20:56');

-- --------------------------------------------------------

--
-- 表的结构 `yuyueguahao`
--

DROP TABLE IF EXISTS `yuyueguahao`;
CREATE TABLE IF NOT EXISTS `yuyueguahao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yishengid` int(10) unsigned NOT NULL COMMENT '医生id',
  `suoshukeshi` varchar(255) NOT NULL COMMENT '所属科室',
  `gonghao` varchar(50) NOT NULL COMMENT '工号',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `guahaofei` decimal(10,2) NOT NULL COMMENT '挂号费',
  `yuyueshijian` varchar(10) NOT NULL COMMENT '预约时间',
  `yuyueren` varchar(50) NOT NULL COMMENT '预约人',
  `issh` varchar(10) NOT NULL DEFAULT '否',
  `iszf` varchar(10) NOT NULL DEFAULT '否',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `yuyueguahao`
--

INSERT INTO `yuyueguahao` (`id`, `yishengid`, `suoshukeshi`, `gonghao`, `xingming`, `guahaofei`, `yuyueshijian`, `yuyueren`, `issh`, `iszf`, `addtime`) VALUES
(1, 2, '1', '002', '王萍', '30.00', '2019-11-30', '张小明', '是', '是', '2019-11-29 07:49:59'),
(2, 8, '9', '008', '张医生', '30.00', '2019-11-30', '朱小明', '是', '是', '2019-11-29 08:27:07');

-- --------------------------------------------------------

--
-- 表的结构 `zhuceyonghu`
--

DROP TABLE IF EXISTS `zhuceyonghu`;
CREATE TABLE IF NOT EXISTS `zhuceyonghu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) NOT NULL COMMENT '用户名',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) NOT NULL COMMENT '性别',
  `dianhua` varchar(50) NOT NULL COMMENT '电话',
  `shenfenzheng` varchar(50) NOT NULL COMMENT '身份证',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  `issh` varchar(10) NOT NULL DEFAULT '否',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `zhuceyonghu`
--

INSERT INTO `zhuceyonghu` (`id`, `yonghuming`, `mima`, `xingming`, `xingbie`, `dianhua`, `shenfenzheng`, `touxiang`, `issh`, `addtime`) VALUES
(1, '张小明', '000', '张小明', '男', '13800138000', '330330198001011111', 'upload/1575012386467.png', '是', '2019-11-29 07:26:27'),
(2, '朱小明', '000', '朱小明', '男', '13800138022', '330330199902020202', 'upload/1575015905031.png', '是', '2019-11-29 08:30:21');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
