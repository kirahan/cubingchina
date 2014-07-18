-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 07 月 18 日 12:10
-- 服务器版本: 5.5.37-log
-- PHP 版本: 5.5.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `cubingchina`
--

--
-- 转存表中的数据 `delegate`
--

INSERT INTO `delegate` (`id`, `name`, `name_zh`, `email`) VALUES
(1, 'Danyang Chen', '陈丹阳', 'danjonopolis@gmail.com'),
(2, 'Fangyuan Chang', '常方圆', 'yuanyuan.2328@qq.com'),
(3, 'Ming Zheng', '郑鸣', 'zmproof@gmail.com'),
(4, 'Donglei Li', '李冬雷', '20003214@sina.com'),
(5, 'Hao Wang', '王皓', 'wanghao@yoercn.com'),
(6, 'Yiliang Lu', '路义亮', 'mangosteen@vip.sina.com'),
(7, 'Xiaobo Jin', '金晓波', 'wavelet1988@gmail.com'),
(8, 'Chan Tak Chuen', '陳德泉', 'kimchikoon@hkrcu.net'),
(9, 'Zhili Zhang', '张志立', '563257311@qq.com'),
(10, 'Hung Lo', '羅鴻', 'austin.lohong@gmail.com');

--
-- 转存表中的数据 `region`
--

INSERT INTO `region` (`id`, `name`, `name_zh`, `pid`) VALUES
(1, 'China', '中国', 0),
(2, 'Hong Kong', '香港', 0),
(3, 'Macau', '澳門', 0),
(4, 'Taiwan', '台灣', 0),
(5, 'Afghanistan', 'Afghanistan', 0),
(6, 'Albania', 'Albania', 0),
(7, 'Algeria', 'Algeria', 0),
(8, 'Angola', 'Angola', 0),
(9, 'Anguilla', 'Anguilla', 0),
(10, 'Antigua', 'Antigua', 0),
(11, 'Argentina', 'Argentina', 0),
(12, 'Armenia', 'Armenia', 0),
(13, 'Aruba', 'Aruba', 0),
(14, 'Australia', 'Australia', 0),
(15, 'Austria', 'Austria', 0),
(16, 'Azerbaijan', 'Azerbaijan', 0),
(17, 'Bahamas', 'Bahamas', 0),
(18, 'Bahrain', 'Bahrain', 0),
(19, 'Bangladesh', 'Bangladesh', 0),
(20, 'Barbados', 'Barbados', 0),
(21, 'Belarus', 'Belarus', 0),
(22, 'Belgium', 'Belgium', 0),
(23, 'Belize', 'Belize', 0),
(24, 'Benin', 'Benin', 0),
(25, 'Bhutan', 'Bhutan', 0),
(26, 'Bolivia', 'Bolivia', 0),
(27, 'Bosnia and Herzegovina', 'Bosnia and Herzegovina', 0),
(28, 'Botswana', 'Botswana', 0),
(29, 'Brazil', 'Brazil', 0),
(30, 'British Virgin Islands', 'British Virgin Islands', 0),
(31, 'Brunei', 'Brunei', 0),
(32, 'Bulgaria', 'Bulgaria', 0),
(33, 'Burkina Faso', 'Burkina Faso', 0),
(34, 'Cambodia', 'Cambodia', 0),
(35, 'Cameroon', 'Cameroon', 0),
(36, 'Canada', 'Canada', 0),
(37, 'Central African Republic', 'Central African Republic', 0),
(38, 'Chad', 'Chad', 0),
(39, 'Chile', 'Chile', 0),
(40, 'Colombia', 'Colombia', 0),
(41, 'Comoros', 'Comoros', 0),
(42, 'Congo', 'Congo', 0),
(43, 'Cook Islands', 'Cook Islands', 0),
(44, 'Costa Rica', 'Costa Rica', 0),
(45, 'Cote d''Ivoire', 'Cote d''Ivoire', 0),
(46, 'Croatia', 'Croatia', 0),
(47, 'Cuba', 'Cuba', 0),
(48, 'Cyprus', 'Cyprus', 0),
(49, 'Czech Republic', 'Czech Republic', 0),
(50, 'Denmark', 'Denmark', 0),
(51, 'Djibouti', 'Djibouti', 0),
(52, 'Dominica', 'Dominica', 0),
(53, 'Dominican Republic', 'Dominican Republic', 0),
(54, 'DR Congo', 'DR Congo', 0),
(55, 'Ecuador', 'Ecuador', 0),
(56, 'Egypt', 'Egypt', 0),
(57, 'El Salvador', 'El Salvador', 0),
(58, 'Equatorial Guinea', 'Equatorial Guinea', 0),
(59, 'Eritrea', 'Eritrea', 0),
(60, 'Estonia', 'Estonia', 0),
(61, 'Ethiopia', 'Ethiopia', 0),
(62, 'Fiji', 'Fiji', 0),
(63, 'Finland', 'Finland', 0),
(64, 'France', 'France', 0),
(65, 'French Guiana', 'French Guiana', 0),
(66, 'French Polynesia', 'French Polynesia', 0),
(67, 'Gabon', 'Gabon', 0),
(68, 'Gambia', 'Gambia', 0),
(69, 'Georgia', 'Georgia', 0),
(70, 'Germany', 'Germany', 0),
(71, 'Ghana', 'Ghana', 0),
(72, 'Greece', 'Greece', 0),
(73, 'Grenada', 'Grenada', 0),
(74, 'Guatemala', 'Guatemala', 0),
(75, 'Guernsey', 'Guernsey', 0),
(76, 'Guinea', 'Guinea', 0),
(77, 'Guyana', 'Guyana', 0),
(78, 'Haiti', 'Haiti', 0),
(79, 'Honduras', 'Honduras', 0),
(80, 'Hungary', 'Hungary', 0),
(81, 'Iceland', 'Iceland', 0),
(82, 'India', 'India', 0),
(83, 'Indonesia', 'Indonesia', 0),
(84, 'Iran', 'Iran', 0),
(85, 'Iraq', 'Iraq', 0),
(86, 'Ireland', 'Ireland', 0),
(87, 'Isle of Man', 'Isle of Man', 0),
(88, 'Israel', 'Israel', 0),
(89, 'Italy', 'Italy', 0),
(90, 'Jamaica', 'Jamaica', 0),
(91, 'Japan', 'Japan', 0),
(92, 'Jordan', 'Jordan', 0),
(93, 'Kazakhstan', 'Kazakhstan', 0),
(94, 'Kenya', 'Kenya', 0),
(95, 'Kiribati', 'Kiribati', 0),
(96, 'Korea', 'Korea', 0),
(97, 'Kosovo', 'Kosovo', 0),
(98, 'Kuwait', 'Kuwait', 0),
(99, 'Laos', 'Laos', 0),
(100, 'Latvia', 'Latvia', 0),
(101, 'Lebanon', 'Lebanon', 0),
(102, 'Lesotho', 'Lesotho', 0),
(103, 'Liberia', 'Liberia', 0),
(104, 'Libya', 'Libya', 0),
(105, 'Lithuania', 'Lithuania', 0),
(106, 'Luxembourg', 'Luxembourg', 0),
(107, 'Macedonia', 'Macedonia', 0),
(108, 'Madagascar', 'Madagascar', 0),
(109, 'Malawi', 'Malawi', 0),
(110, 'Malaysia', 'Malaysia', 0),
(111, 'Mali', 'Mali', 0),
(112, 'Malta', 'Malta', 0),
(113, 'Marshall Islands', 'Marshall Islands', 0),
(114, 'Mauritania', 'Mauritania', 0),
(115, 'Mauritius', 'Mauritius', 0),
(116, 'Mayotte', 'Mayotte', 0),
(117, 'Mexico', 'Mexico', 0),
(118, 'Moldova', 'Moldova', 0),
(119, 'Mongolia', 'Mongolia', 0),
(120, 'Montenegro', 'Montenegro', 0),
(121, 'Montserrat', 'Montserrat', 0),
(122, 'Morocco', 'Morocco', 0),
(123, 'Mozambique', 'Mozambique', 0),
(124, 'Myanmar', 'Myanmar', 0),
(125, 'Namibia', 'Namibia', 0),
(126, 'Nauru', 'Nauru', 0),
(127, 'Nepal', 'Nepal', 0),
(128, 'Netherlands', 'Netherlands', 0),
(129, 'New Caledonia', 'New Caledonia', 0),
(130, 'New Zealand', 'New Zealand', 0),
(131, 'Nicaragua', 'Nicaragua', 0),
(132, 'Niger', 'Niger', 0),
(133, 'Nigeria', 'Nigeria', 0),
(134, 'Niue', 'Niue', 0),
(135, 'North Korea', 'North Korea', 0),
(136, 'Norway', 'Norway', 0),
(137, 'Oman', 'Oman', 0),
(138, 'Pakistan', 'Pakistan', 0),
(139, 'Palestine', 'Palestine', 0),
(140, 'Panama', 'Panama', 0),
(141, 'Papua New Guinea', 'Papua New Guinea', 0),
(142, 'Paraguay', 'Paraguay', 0),
(143, 'Peru', 'Peru', 0),
(144, 'Philippines', 'Philippines', 0),
(145, 'Pitcairn Islands', 'Pitcairn Islands', 0),
(146, 'Poland', 'Poland', 0),
(147, 'Portugal', 'Portugal', 0),
(148, 'Puerto Rico', 'Puerto Rico', 0),
(149, 'Qatar', 'Qatar', 0),
(150, 'Romania', 'Romania', 0),
(151, 'Russia', 'Russia', 0),
(152, 'Saint Kitts and Nevis', 'Saint Kitts and Nevis', 0),
(153, 'Saint Lucia', 'Saint Lucia', 0),
(154, 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 0),
(155, 'Samoa', 'Samoa', 0),
(156, 'San Marino', 'San Marino', 0),
(157, 'Sao Tome and Principe', 'Sao Tome and Principe', 0),
(158, 'Saudi Arabia', 'Saudi Arabia', 0),
(159, 'Senegal', 'Senegal', 0),
(160, 'Serbia', 'Serbia', 0),
(161, 'Sierra Leone', 'Sierra Leone', 0),
(162, 'Singapore', 'Singapore', 0),
(163, 'Slovakia', 'Slovakia', 0),
(164, 'Slovenia', 'Slovenia', 0),
(165, 'Solomon Islands', 'Solomon Islands', 0),
(166, 'Somalia', 'Somalia', 0),
(167, 'South Africa', 'South Africa', 0),
(168, 'South Sudan', 'South Sudan', 0),
(169, 'Spain', 'Spain', 0),
(170, 'Sri Lanka', 'Sri Lanka', 0),
(171, 'Sudan', 'Sudan', 0),
(172, 'Suriname', 'Suriname', 0),
(173, 'Swaziland', 'Swaziland', 0),
(174, 'Sweden', 'Sweden', 0),
(175, 'Switzerland', 'Switzerland', 0),
(176, 'Syria', 'Syria', 0),
(177, 'Tanzania', 'Tanzania', 0),
(178, 'Thailand', 'Thailand', 0),
(179, 'Togo', 'Togo', 0),
(180, 'Tonga', 'Tonga', 0),
(181, 'Trinidad and Tobago', 'Trinidad and Tobago', 0),
(182, 'Tunisia', 'Tunisia', 0),
(183, 'Turkey', 'Turkey', 0),
(184, 'Turks and Caicos Islands', 'Turks and Caicos Islands', 0),
(185, 'Tuvalu', 'Tuvalu', 0),
(186, 'Uganda', 'Uganda', 0),
(187, 'Ukraine', 'Ukraine', 0),
(188, 'United Arab Emirates', 'United Arab Emirates', 0),
(189, 'United Kingdom', 'United Kingdom', 0),
(190, 'Uruguay', 'Uruguay', 0),
(191, 'USA', 'USA', 0),
(192, 'Vanuatu', 'Vanuatu', 0),
(193, 'Venezuela', 'Venezuela', 0),
(194, 'Vietnam', 'Vietnam', 0),
(195, 'Yemen', 'Yemen', 0),
(196, 'Zambia', 'Zambia', 0),
(197, 'Zimbabwe', 'Zimbabwe', 0),
(198, 'Anhui', '安徽', 1),
(199, 'Anqing', '安庆市', 198),
(200, 'Bengbu', '蚌埠市', 198),
(201, 'Chizhou', '池州市', 198),
(202, 'Chuzhou', '滁州市', 198),
(203, 'Fuyang', '阜阳市', 198),
(204, 'Hefei', '合肥市', 198),
(205, 'Huaibei', '淮北市', 198),
(206, 'Huainan', '淮南市', 198),
(207, 'Huangshan', '黄山市', 198),
(208, 'Liuan', '六安市', 198),
(209, 'Maanshan', '马鞍山市', 198),
(210, 'Suzhou', '宿州市', 198),
(211, 'Tongling', '铜陵市', 198),
(212, 'Wuhu', '芜湖市', 198),
(213, 'Xuancheng', '宣城市', 198),
(214, 'Haozhou', '亳州市', 198),
(215, 'Beijing', '北京', 1),
(216, 'Changping', '昌平区', 215),
(217, 'Chaoyang', '朝阳区', 215),
(218, 'Chongwen', '崇文区', 215),
(219, 'Daxing', '大兴区', 215),
(220, 'Dongcheng', '东城区', 215),
(221, 'Fangshan', '房山区', 215),
(222, 'Fengtai', '丰台区', 215),
(223, 'Haidian', '海淀区', 215),
(224, 'Huairou', '怀柔区', 215),
(225, 'Mentougou', '门头沟', 215),
(226, 'Miyun', '密云区', 215),
(227, 'Pinggu', '平谷区', 215),
(228, 'Shijingshan', '石景山区', 215),
(229, 'Shunyi', '顺义区', 215),
(230, 'Tongzhou', '通州区', 215),
(231, 'Xicheng', '西城区', 215),
(232, 'Xuanwu', '宣武区', 215),
(233, 'Yanqing', '延庆县', 215),
(234, 'Fujian', '福建', 1),
(235, 'Fuzhou', '福州市', 234),
(236, 'Longyan', '龙岩市', 234),
(237, 'Nanping', '南平市', 234),
(238, 'Ningde', '宁德市', 234),
(239, 'Putian', '莆田市', 234),
(240, 'Quanzhou', '泉州市', 234),
(241, 'Sanming', '三明市', 234),
(242, 'Xiamen', '厦门市', 234),
(243, 'Zhangzhou', '漳州市', 234),
(244, 'Gansu', '甘肃', 1),
(245, 'Baiyin', '白银市', 244),
(246, 'Dingxi', '定西市', 244),
(247, 'Gannan', '甘南州', 244),
(248, 'Jiayuguan', '嘉峪关市', 244),
(249, 'Jinchang', '金昌市', 244),
(250, 'Jiuquan', '酒泉市', 244),
(251, 'Lanzhou', '兰州市', 244),
(252, 'Linxia', '临夏州', 244),
(253, 'Longnan', '陇南市', 244),
(254, 'Pingliang', '平凉市', 244),
(255, 'Qingyang', '庆阳市', 244),
(256, 'Tianshui', '天水市', 244),
(257, 'Wuwei', '武威市', 244),
(258, 'Zhangye', '张掖市', 244),
(259, 'Guangdong', '广东', 1),
(260, 'Chaozhou', '潮州市', 259),
(261, 'Dongguan', '东莞市', 259),
(262, 'Foshan', '佛山市', 259),
(263, 'Guangzhou', '广州市', 259),
(264, 'Heyuan', '河源市', 259),
(265, 'Huizhou', '惠州市', 259),
(266, 'Jiangmen', '江门市', 259),
(267, 'Jieyang', '揭阳市', 259),
(268, 'Maoming', '茂名市', 259),
(269, 'Meizhou', '梅州市', 259),
(270, 'Qingyuan', '清远市', 259),
(271, 'Shantou', '汕头市', 259),
(272, 'Shanwei', '汕尾市', 259),
(273, 'Shaoguan', '韶关市', 259),
(274, 'Shenzhen', '深圳市', 259),
(275, 'Yangjiang', '阳江市', 259),
(276, 'Yunfu', '云浮市', 259),
(277, 'Zhanjiang', '湛江市', 259),
(278, 'Zhaoqing', '肇庆市', 259),
(279, 'Zhongshan', '中山市', 259),
(280, 'Zhuhai', '珠海市', 259),
(281, 'Guangxi', '广西', 1),
(282, 'Baise', '百色市', 281),
(283, 'North Sea', '北海市', 281),
(284, 'Chongzuo', '崇左市', 281),
(285, 'Fangchenggang', '防城港市', 281),
(286, 'Guilin', '桂林市', 281),
(287, 'Guigang', '贵港市', 281),
(288, 'Hechi', '河池市', 281),
(289, 'Hezhou', '贺州市', 281),
(290, 'Laibin', '来宾市', 281),
(291, 'Liuzhou', '柳州市', 281),
(292, 'Nanning', '南宁市', 281),
(293, 'Qinzhou', '钦州市', 281),
(294, 'Wuzhou', '梧州市', 281),
(295, 'Yulin', '玉林市', 281),
(296, 'Guizhou', '贵州', 1),
(297, 'Anshun', '安顺市', 296),
(298, 'Bijie', '毕节市', 296),
(299, 'Guiyang', '贵阳市', 296),
(300, 'Liupanshui', '六盘水市', 296),
(301, 'Qiandongnan', '黔东南州', 296),
(302, 'Qiannan', '黔南州', 296),
(303, 'Qianxinan', '黔西南州', 296),
(304, 'Tongren', '铜仁市', 296),
(305, 'Zunyi', '遵义市', 296),
(306, 'Hainan', '海南', 1),
(307, 'Baisha', '白沙县', 306),
(308, 'Baoting', '保亭县', 306),
(309, 'Changjiang', '昌江县', 306),
(310, 'Chengmai', '澄迈县', 306),
(311, 'Dingan', '定安县', 306),
(312, 'Dongfang', '东方市', 306),
(313, 'Haikou', '海口市', 306),
(314, 'Ledong', '乐东县', 306),
(315, 'Lingao', '临高县', 306),
(316, 'Lingshui', '陵水县', 306),
(317, 'Qionghai', '琼海市', 306),
(318, 'Qiongzhong', '琼中县', 306),
(319, 'Sansha', '三沙市', 306),
(320, 'Sanya', '三亚市', 306),
(321, 'Tunchang', '屯昌县', 306),
(322, 'Wanning', '万宁市', 306),
(323, 'Wenchang', '文昌市', 306),
(324, 'Wuzhishan', '五指山市', 306),
(325, 'Danzhou', '儋州市', 306),
(326, 'Hebei', '河北', 1),
(327, 'Baoding', '保定市', 326),
(328, 'Cangzhou', '沧州市', 326),
(329, 'Chengde', '承德市', 326),
(330, 'Handan', '邯郸市', 326),
(331, 'Hengshui', '衡水市', 326),
(332, 'Langfang', '廊坊市', 326),
(333, 'Qinhuangdao', '秦皇岛市', 326),
(334, 'Shijiazhuang', '石家庄市', 326),
(335, 'Tangshan', '唐山市', 326),
(336, 'Xingtai', '邢台市', 326),
(337, 'Zhangjiakou', '张家口市', 326),
(338, 'Henan', '河南', 1),
(339, 'Anyang', '安阳市', 338),
(340, 'Hebi', '鹤壁市', 338),
(341, 'Jiyuan', '济源市', 338),
(342, 'Jiaozuo', '焦作市', 338),
(343, 'Kaifeng', '开封市', 338),
(344, 'Luoyang', '洛阳市', 338),
(345, 'Nanyang', '南阳市', 338),
(346, 'Pingdingshan', '平顶山市', 338),
(347, 'Sanmenxia', '三门峡市', 338),
(348, 'Shangqiu', '商丘市', 338),
(349, 'Xinxiang', '新乡市', 338),
(350, 'Xinyang', '信阳市', 338),
(351, 'Xuchang', '许昌市', 338),
(352, 'Zhengzhou', '郑州市', 338),
(353, 'Zhoukou', '周口市', 338),
(354, 'Zhumadian', '驻马店市', 338),
(355, 'Luohe', '漯河市', 338),
(356, 'Puyang', '濮阳市', 338),
(357, 'Heilongjiang', '黑龙江', 1),
(358, 'Daqing', '大庆市', 357),
(359, 'Daxinganling', '大兴安岭地区', 357),
(360, 'Harbin', '哈尔滨市', 357),
(361, 'Hegang', '鹤岗市', 357),
(362, 'Heihe', '黑河市', 357),
(363, 'Jixi', '鸡西市', 357),
(364, 'Jiamusi', '佳木斯市', 357),
(365, 'Mudanjiang', '牡丹江市', 357),
(366, 'Qitaihe', '七台河市', 357),
(367, 'Qiqihar', '齐齐哈尔市', 357),
(368, 'Shuangyashan', '双鸭山市', 357),
(369, 'Suihua', '绥化市', 357),
(370, 'Yichun', '伊春市', 357),
(371, 'Hubei', '湖北', 1),
(372, 'Ezhou', '鄂州市', 371),
(373, 'Enshi', '恩施州', 371),
(374, 'Huanggang', '黄冈市', 371),
(375, 'Huangshi', '黄石市', 371),
(376, 'Jingmen', '荆门市', 371),
(377, 'Jingzhou', '荆州市', 371),
(378, 'Qianjiang', '潜江市', 371),
(379, 'Shennongjia', '神农架林区', 371),
(380, 'Shiyan', '十堰市', 371),
(381, 'Suizhou', '随州市', 371),
(382, 'Tianmen', '天门市', 371),
(383, 'Wuhan', '武汉市', 371),
(384, 'Xiantao', '仙桃市', 371),
(385, 'Xianning', '咸宁市', 371),
(386, 'Xiangyang', '襄阳市', 371),
(387, 'Xiaogan', '孝感市', 371),
(388, 'Yichang', '宜昌市', 371),
(389, 'Hunan', '湖南', 1),
(390, 'Changde', '常德市', 389),
(391, 'Changsha', '长沙市', 389),
(392, 'Chenzhou', '郴州市', 389),
(393, 'Hengyang', '衡阳市', 389),
(394, 'Huaihua', '怀化市', 389),
(395, 'Loudi', '娄底市', 389),
(396, 'Shaoshan', '韶山市', 389),
(397, 'Shaoyang', '邵阳市', 389),
(398, 'Xiangtan', '湘潭市', 389),
(399, 'Xiangxi', '湘西州', 389),
(400, 'Yiyang', '益阳市', 389),
(401, 'Yongzhou', '永州市', 389),
(402, 'Yueyang', '岳阳市', 389),
(403, 'Zhangjiajie', '张家界市', 389),
(404, 'Zhuzhou', '株洲市', 389),
(405, 'Jilin', '吉林', 1),
(406, 'Baicheng', '白城市', 405),
(407, 'Baishan', '白山市', 405),
(408, 'Changchun', '长春市', 405),
(409, 'Jilin', '吉林市', 405),
(410, 'Liaoyuan', '辽源市', 405),
(411, 'Siping', '四平市', 405),
(412, 'Songyuan', '松原市', 405),
(413, 'Tonghua', '通化市', 405),
(414, 'Yanbian', '延边州', 405),
(415, 'Jiangsu', '江苏', 1),
(416, 'Changzhou', '常州市', 415),
(417, 'Huaian', '淮安市', 415),
(418, 'Lianyungang', '连云港市', 415),
(419, 'Nanjing', '南京市', 415),
(420, 'Nantong', '南通市', 415),
(421, 'Suzhou', '苏州市', 415),
(422, 'Suqian', '宿迁市', 415),
(423, 'Taizhou', '泰州市', 415),
(424, 'Wuxi', '无锡市', 415),
(425, 'Xuzhou', '徐州市', 415),
(426, 'Yancheng', '盐城市', 415),
(427, 'Yangzhou', '扬州市', 415),
(428, 'Zhenjiang', '镇江市', 415),
(429, 'Jiangxi', '江西', 1),
(430, 'Fuzhou', '抚州市', 429),
(431, 'Ganzhou', '赣州市', 429),
(432, 'Ji''an', '吉安市', 429),
(433, 'Jingdezhen', '景德镇市', 429),
(434, 'Jiujiang', '九江市', 429),
(435, 'Nanchang', '南昌市', 429),
(436, 'Pingxiang', '萍乡市', 429),
(437, 'Shangrao', '上饶市', 429),
(438, 'Xinyu', '新余市', 429),
(439, 'Yichun', '宜春市', 429),
(440, 'Yingtan', '鹰潭市', 429),
(441, 'Liaoning', '辽宁', 1),
(442, 'Anshan', '鞍山市', 441),
(443, 'Benxi', '本溪市', 441),
(444, 'Chaoyang', '朝阳市', 441),
(445, 'Dalian', '大连市', 441),
(446, 'Dandong', '丹东市', 441),
(447, 'Fushun', '抚顺市', 441),
(448, 'Fuxin', '阜新市', 441),
(449, 'Huludao', '葫芦岛市', 441),
(450, 'Jinzhou', '锦州市', 441),
(451, 'Liaoyang', '辽阳市', 441),
(452, 'Panjin', '盘锦市', 441),
(453, 'Shenyang', '沈阳市', 441),
(454, 'Tieling', '铁岭市', 441),
(455, 'Yingkou', '营口市', 441),
(456, 'Inner Mongolia', '内蒙古', 1),
(457, 'Alxa League', '阿拉善盟', 456),
(458, 'Bayan Nur', '巴彦淖尔市', 456),
(459, 'Baotou', '包头市', 456),
(460, 'Chifeng', '赤峰市', 456),
(461, 'Ordos', '鄂尔多斯市', 456),
(462, 'Hohhot', '呼和浩特市', 456),
(463, 'Hulun Buir', '呼伦贝尔市', 456),
(464, 'Tongliao', '通辽市', 456),
(465, 'Wuhai', '乌海市', 456),
(466, 'Ulanqab', '乌兰察布市', 456),
(467, 'Xilingol League', '锡林郭勒盟', 456),
(468, 'Hinggan League', '兴安盟', 456),
(469, 'Ningxia', '宁夏', 1),
(470, 'Guyuan', '固原市', 469),
(471, 'Shizuishan', '石嘴山市', 469),
(472, 'Wuzhong', '吴忠市', 469),
(473, 'Yinchuan', '银川市', 469),
(474, 'Zhongwei', '中卫市', 469),
(475, 'Qinghai', '青海', 1),
(476, 'Guoluo', '果洛州', 475),
(477, 'Haibei', '海北州', 475),
(478, 'Haidong', '海东地区', 475),
(479, 'Hainan', '海南州', 475),
(480, 'Haixi', '海西州', 475),
(481, 'Huangnan', '黄南州', 475),
(482, 'Xining', '西宁市', 475),
(483, 'Yushu', '玉树州', 475),
(484, 'Shandong', '山东', 1),
(485, 'Binzhou', '滨州市', 484),
(486, 'Dezhou', '德州市', 484),
(487, 'Dongying', '东营市', 484),
(488, 'Heze', '菏泽市', 484),
(489, 'Jinan', '济南市', 484),
(490, 'Jining', '济宁市', 484),
(491, 'Laiwu', '莱芜市', 484),
(492, 'Liaocheng', '聊城市', 484),
(493, 'Linyi', '临沂市', 484),
(494, 'Qingdao', '青岛市', 484),
(495, 'Sunshine', '日照市', 484),
(496, 'Taian', '泰安市', 484),
(497, 'Weihai', '威海市', 484),
(498, 'Weifang', '潍坊市', 484),
(499, 'Yantai', '烟台市', 484),
(500, 'Zaozhuang', '枣庄市', 484),
(501, 'Zibo', '淄博市', 484),
(502, 'Shanxi', '山西', 1),
(503, 'Changzhi', '长治市', 502),
(504, 'Datong', '大同市', 502),
(505, 'Jincheng', '晋城市', 502),
(506, 'Jinzhong', '晋中市', 502),
(507, 'Linfen', '临汾市', 502),
(508, 'Lüliang', '吕梁市', 502),
(509, 'Shuozhou', '朔州市', 502),
(510, 'Taiyuan', '太原市', 502),
(511, 'Xinzhou', '忻州市', 502),
(512, 'Yangquan', '阳泉市', 502),
(513, 'Yuncheng', '运城市', 502),
(514, 'Shaanxi', '陕西', 1),
(515, 'Ankang', '安康市', 514),
(516, 'Baoji', '宝鸡市', 514),
(517, 'Hanzhong', '汉中市', 514),
(518, 'Shangluo', '商洛市', 514),
(519, 'Tongchuan', '铜川市', 514),
(520, 'Weinan', '渭南市', 514),
(521, 'Xi''an', '西安市', 514),
(522, 'Xianyang', '咸阳市', 514),
(523, 'Yan''an', '延安市', 514),
(524, 'Yulin', '榆林市', 514),
(525, 'Shanghai', '上海', 1),
(526, 'Baoshan', '宝山区', 525),
(527, 'Changning', '长宁区', 525),
(528, 'Chongming', '崇明县', 525),
(529, 'Fengxian', '奉贤区', 525),
(530, 'Hongkou', '虹口区', 525),
(531, 'Huangpu', '黄浦区', 525),
(532, 'Jiading', '嘉定区', 525),
(533, 'Jinshan', '金山区', 525),
(534, 'Jing''an', '静安区', 525),
(535, 'Luwan', '卢湾区', 525),
(536, 'Nanhui', '南汇区', 525),
(537, 'Putuo', '普陀区', 525),
(538, 'Pudong', '浦东新区', 525),
(539, 'Qingpu', '青浦区', 525),
(540, 'Songjiang', '松江区', 525),
(541, 'Xuhui', '徐汇区', 525),
(542, 'Yangpu', '杨浦区', 525),
(543, 'Zhabei', '闸北区', 525),
(544, 'Minhang', '闵行区', 525),
(545, 'Sichuan', '四川', 1),
(546, 'Aba', '阿坝州', 545),
(547, 'Bazhong', '巴中市', 545),
(548, 'Chengdu', '成都市', 545),
(549, 'Dazhou', '达州市', 545),
(550, 'Deyang', '德阳市', 545),
(551, 'Garzê', '甘孜州', 545),
(552, 'Guang''an', '广安市', 545),
(553, 'Guangyuan', '广元市', 545),
(554, 'Leshan', '乐山市', 545),
(555, 'Liangshan', '凉山州', 545),
(556, 'Meishan', '眉山市', 545),
(557, 'Mianyang', '绵阳市', 545),
(558, 'Nanchong', '南充市', 545),
(559, 'Neijiang', '内江市', 545),
(560, 'Panzhihua', '攀枝花市', 545),
(561, 'Suining', '遂宁市', 545),
(562, 'Ya''an', '雅安市', 545),
(563, 'Yibin', '宜宾市', 545),
(564, 'Ziyang', '资阳市', 545),
(565, 'Zigong', '自贡市', 545),
(566, 'Luzhou', '泸州市', 545),
(567, 'Tianjin', '天津', 1),
(568, 'Baodi', '宝坻区', 567),
(569, 'Beichen', '北辰区', 567),
(570, 'Dagang', '大港区', 567),
(571, 'Dongli', '东丽区', 567),
(572, 'Hangu', '汉沽区', 567),
(573, 'Heping', '和平区', 567),
(574, 'Hebei', '河北区', 567),
(575, 'Hedong', '河东区', 567),
(576, 'Hexi', '河西区', 567),
(577, 'Hongqiao', '红桥区', 567),
(578, 'Jixian', '蓟县', 567),
(579, 'Jinnan', '津南区', 567),
(580, 'Jinghai', '静海县', 567),
(581, 'Nankai', '南开区', 567),
(582, 'Ninghe', '宁河县', 567),
(583, 'Tanggu', '塘沽区', 567),
(584, 'Wuqing', '武清区', 567),
(585, 'Xiqing', '西青区', 567),
(586, 'Tibet', '西藏', 1),
(587, 'Ngari', '阿里地区', 586),
(588, 'Chamdo', '昌都地区', 586),
(589, 'Lhasa', '拉萨市', 586),
(590, 'Nyingchi', '林芝地区', 586),
(591, 'Nagqu', '那曲地区', 586),
(592, 'Shigatse', '日喀则地区', 586),
(593, 'Shannan', '山南地区', 586),
(594, 'Xinjiang', '新疆', 1),
(595, 'Aksu', '阿克苏地区', 594),
(596, 'Alaer', '阿拉尔市', 594),
(597, 'Aletai', '阿勒泰地区', 594),
(598, 'Bayingolin', '巴音郭楞州', 594),
(599, 'Bortala', '博尔塔拉州', 594),
(600, 'Changji', '昌吉州', 594),
(601, 'Hami', '哈密地区', 594),
(602, 'Wada', '和田地区', 594),
(603, 'Kashi', '喀什地区', 594),
(604, 'Karamay', '克拉玛依市', 594),
(605, 'Kizilsu', '克孜勒苏州', 594),
(606, 'Shihezi', '石河子市', 594),
(607, 'Tacheng', '塔城地区', 594),
(608, 'Tumushuke', '图木舒克市', 594),
(609, 'Turpan', '吐鲁番地区', 594),
(610, 'Urumqi', '乌鲁木齐市', 594),
(611, 'Wujiaqu', '五家渠市', 594),
(612, 'Yili', '伊犁州', 594),
(613, 'Yunnan', '云南', 1),
(614, 'Baoshan', '保山市', 613),
(615, 'Chuxiong', '楚雄州', 613),
(616, 'Dali', '大理州', 613),
(617, 'Dehong', '德宏州', 613),
(618, 'Diqing', '迪庆州', 613),
(619, 'Honghe', '红河州', 613),
(620, 'Kunming', '昆明市', 613),
(621, 'Lijiang', '丽江市', 613),
(622, 'Lincang', '临沧市', 613),
(623, 'Nujiang', '怒江州', 613),
(624, 'Puer', '普洱市', 613),
(625, 'Qujing', '曲靖市', 613),
(626, 'Wenshan', '文山州', 613),
(627, 'Xishuangbanna', '西双版纳州', 613),
(628, 'Yuxi', '玉溪市', 613),
(629, 'Zhaotong', '昭通市', 613),
(630, 'Zhejiang', '浙江', 1),
(631, 'Hangzhou', '杭州市', 630),
(632, 'Huzhou', '湖州市', 630),
(633, 'Jiaxing', '嘉兴市', 630),
(634, 'Jinhua', '金华市', 630),
(635, 'Lishui', '丽水市', 630),
(636, 'Ningbo', '宁波市', 630),
(637, 'Shaoxing', '绍兴市', 630),
(638, 'Taizhou', '台州市', 630),
(639, 'Wenzhou', '温州市', 630),
(640, 'Zhoushan', '舟山市', 630),
(641, 'Quzhou', '衢州市', 630),
(642, 'Chongqing', '重庆', 1),
(643, 'Banan', '巴南区', 642),
(644, 'New north zone', '北部新区', 642),
(645, 'Beibei', '北碚区', 642),
(646, 'Changshou', '长寿区', 642),
(647, 'Chengkou', '城口县', 642),
(648, 'Dadukou', '大渡口区', 642),
(649, 'Dazu', '大足区', 642),
(650, 'Dianjiang', '垫江县', 642),
(651, 'Fengdu', '丰都县', 642),
(652, 'Fengjie', '奉节县', 642),
(653, 'Fuling', '涪陵区', 642),
(654, 'Gaoxin', '高新区', 642),
(655, 'Hechuan', '合川区', 642),
(656, 'Jiangbei', '江北区', 642),
(657, 'Jiangjin', '江津区', 642),
(658, 'Jiulongpo', '九龙坡区', 642),
(659, 'Kaixian', '开县', 642),
(660, 'Liangping', '梁平县', 642),
(661, 'Nan''an', '南岸区', 642),
(662, 'Nanchuan', '南川区', 642),
(663, 'Pengshui', '彭水县', 642),
(664, 'Qianjiang', '黔江区', 642),
(665, 'Rongchang', '荣昌县', 642),
(666, 'Shapingba', '沙坪坝区', 642),
(667, 'Shizhu', '石柱县', 642),
(668, 'Tongliang', '铜梁县', 642),
(669, 'Wanzhou', '万州区', 642),
(670, 'Wushan', '巫山县', 642),
(671, 'Wuxi', '巫溪县', 642),
(672, 'Wulong', '武隆县', 642),
(673, 'Xiushan', '秀山县', 642),
(674, 'Yongchuan', '永川区', 642),
(675, 'Youyang', '酉阳县', 642),
(676, 'Yubei', '渝北区', 642),
(677, 'Yuzhong', '渝中区', 642),
(678, 'Yunyang', '云阳县', 642),
(679, 'Zhongxian', '忠县', 642),
(680, 'Tongnan', '潼南县', 642),
(681, 'Bishan', '璧山县', 642),
(682, 'Qijiang', '綦江区', 642);

--
-- 转存表中的数据 `rounds`
--

INSERT INTO `rounds` (`id`, `rank`, `name`, `cellName`) VALUES
('d', 20, 'Combined First round', 'Combined First'),
('1', 29, 'First round', 'First'),
('2', 50, 'Second round', 'Second'),
('e', 59, 'Combined Second round', 'Combined Second'),
('g', 70, 'Combined Third round', 'Combined Third'),
('3', 79, 'Semi Final', 'Semi Final'),
('c', 90, 'Combined Final', 'Combined Final'),
('f', 99, 'Final', 'Final');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
