-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.1.34-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win32
-- HeidiSQL Версия:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных test_news
CREATE DATABASE IF NOT EXISTS `test_news` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test_news`;

-- Дамп структуры для таблица test_news.news
CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `theme_id` int(11) NOT NULL DEFAULT '0',
  `text` text,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `FK_news_themes` (`theme_id`),
  CONSTRAINT `FK_news_themes` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы test_news.news: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`news_id`, `date`, `theme_id`, `text`, `title`) VALUES
	(1, '2019-10-17', 1, 'Значимость этих проблем настолько очевидна, что новая модель организационной деятельности играет важную роль в формировании направлений прогрессивного развития. С другой стороны укрепление и развитие структуры позволяет выполнять важные задания по разработке соответствующий условий активизации. Равным образом сложившаяся структура организации обеспечивает широкому кругу (специалистов) участие в формировании форм развития.', 'Значимость этих проблем'),
	(2, '2019-10-15', 2, 'Равным образом рамки и место обучения кадров влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствует насущным потребностям. Идейные соображения высшего порядка, а также реализация намеченных плановых заданий обеспечивает широкому кругу (специалистов) участие в формировании систем массового участия. Товарищи! постоянный количественный рост и сфера нашей активности позволяет оценить значение систем массового участия. Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности позволяет выполнять важные задания по разработке позиций, занимаемых участниками в отношении поставленных задач. Повседневная практика показывает, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям.', 'Равным образом'),
	(3, '2015-09-12', 3, 'Товарищи! рамки и место обучения кадров играет важную роль в формировании модели развития. С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности способствует подготовки и реализации модели развития. Повседневная практика показывает, что консультация с широким активом позволяет выполнять важные задания по разработке направлений прогрессивного развития.', 'Товарищи!'),
	(4, '2018-06-27', 5, 'Таким образом реализация намеченных плановых заданий позволяет выполнять важные задания по разработке дальнейших направлений развития. Задача организации, в особенности же сложившаяся структура организации обеспечивает широкому кругу (специалистов) участие в формировании дальнейших направлений развития. Товарищи! рамки и место обучения кадров в значительной степени обуславливает создание систем массового участия. С другой стороны рамки и место обучения кадров обеспечивает широкому кругу (специалистов) участие в формировании существенных финансовых и административных условий. Задача организации, в особенности же сложившаяся структура организации позволяет оценить значение модели развития.', 'Таким образом реализация'),
	(5, '2017-10-17', 1, 'Задача организации, в особенности же рамки и место обучения кадров позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Значимость этих проблем настолько очевидна, что сложившаяся структура организации в значительной степени обуславливает создание систем массового участия. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития. Разнообразный и богатый опыт начало повседневной работы по формированию позиции позволяет оценить значение систем массового участия.', 'Задача организации'),
	(8, '2015-09-17', 5, 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании существенных финансовых и административных условий. Повседневная практика показывает, что постоянное информационно-пропагандистское обеспечение нашей деятельности способствует подготовки и реализации системы обучения кадров, соответствует насущным потребностям. Значимость этих проблем настолько очевидна, что постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании систем массового участия. Разнообразный и богатый опыт дальнейшее развитие различных форм деятельности обеспечивает широкому кругу (специалистов) участие в формировании новых предложений. Повседневная практика показывает, что начало повседневной работы по формированию позиции влечет за собой процесс внедрения и модернизации модели развития. Идейные соображения высшего порядка, а также рамки и место обучения кадров влечет за собой процесс внедрения и модернизации форм развития.', 'Идейные соображения высшего порядка'),
	(9, '2016-09-09', 6, 'Повседневная практика показывает, что постоянное информационно-пропагандистское обеспечение нашей деятельности играет важную роль в формировании существенных финансовых и административных условий. Не следует, однако забывать, что постоянный количественный рост и сфера нашей активности играет важную роль в формировании позиций, занимаемых участниками в отношении поставленных задач. Не следует, однако забывать, что реализация намеченных плановых заданий способствует подготовки и реализации систем массового участия. Повседневная практика показывает, что укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач.', 'Повседневная практика показывает'),
	(10, '2016-05-15', 1, 'Задача организации, в особенности же постоянное информационно-пропагандистское обеспечение нашей деятельности в значительной степени обуславливает создание форм развития. Не следует, однако забывать, что постоянный количественный рост и сфера нашей активности влечет за собой процесс внедрения и модернизации систем массового участия.', 'Задача организации'),
	(11, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(12, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(13, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(14, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(15, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(16, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(17, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(18, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(19, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(20, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(21, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(22, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(23, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(24, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(25, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем'),
	(26, '2016-05-04', 6, 'Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт рамки и место обучения кадров позволяет выполнять важные задания по разработке дальнейших направлений развития. Товарищи! укрепление и развитие структуры требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание систем массового участия.', 'Значимость этих проблем');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

-- Дамп структуры для таблица test_news.themes
CREATE TABLE IF NOT EXISTS `themes` (
  `theme_id` int(11) NOT NULL,
  `theme_title` varchar(255) NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы test_news.themes: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` (`theme_id`, `theme_title`) VALUES
	(1, 'Наука'),
	(2, 'Спорт'),
	(3, 'Интернет'),
	(4, 'Авто'),
	(5, 'Глямур'),
	(6, 'Искусство');
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;