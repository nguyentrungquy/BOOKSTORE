-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2018 at 03:45 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datn`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `lever` tinyint(4) DEFAULT '1',
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `address`, `email`, `password`, `phone`, `status`, `lever`, `avatar`, `create_at`, `update_at`) VALUES
(23, 'Nguyễn Trung Quy', 'Vĩnh Tường- Vĩnh Phúc', 'nguyentrungquy96@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0968478588', 1, 2, NULL, NULL, NULL),
(24, 'admin', 'Hà Nội', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '01694964412', 1, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blsanpham`
--

CREATE TABLE `blsanpham` (
  `id` int(11) NOT NULL,
  `id_sp` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blsanpham`
--

INSERT INTO `blsanpham` (`id`, `id_sp`, `name`, `phone`, `comment`, `date`) VALUES
(1, NULL, 'quy', '123456', 'hello', NULL),
(2, NULL, 'chinh', '12345678', 'tuyệt', NULL),
(3, NULL, 'trang', '1234567', 'hay quá', NULL),
(4, NULL, 'toan', '123456', 'oke', NULL),
(5, NULL, 'quy', '09847855', 'hello', NULL),
(6, NULL, 'quy', '0968478588', 'oke\r\n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `images`, `banner`, `home`, `status`, `create_at`, `update_at`) VALUES
(15, 'Văn Học', 'van-hoc', NULL, NULL, 1, 1, '2018-05-14 14:21:35', '2018-05-14 14:27:06'),
(16, 'Kinh tế', 'kinh-te', NULL, NULL, 1, 1, '2018-05-14 14:21:45', '2018-05-14 14:27:07'),
(17, 'Kỹ năng sống', 'ky-nang-song', NULL, NULL, 1, 1, '2018-05-14 14:22:05', '2018-05-19 08:08:55'),
(18, 'Khoa học - Công nghệ', 'khoa-hoc---cong-nghe', NULL, NULL, 1, 1, '2018-05-14 14:22:26', '2018-05-19 08:09:01'),
(19, 'Danh nhân-Văn hóa-Du lịch', 'danh-nhan-van-hoa-du-lich', NULL, NULL, 1, 1, '2018-05-14 14:25:12', '2018-05-29 18:24:49'),
(20, 'Y học - Sức khỏe', 'y-hoc---suc-khoe', NULL, NULL, 0, 1, '2018-05-14 14:25:39', '2018-05-19 03:29:52'),
(21, 'Ngoại ngữ', 'ngoai-ngu', NULL, NULL, 0, 1, '2018-05-14 14:25:57', '2018-05-19 03:29:55'),
(22, 'Thể dục - Thể thao', 'the-duc---the-thao', NULL, NULL, 0, 1, '2018-05-14 14:26:13', '2018-05-19 03:29:57'),
(23, 'Tin học', 'tin-hoc', NULL, NULL, 0, 1, '2018-05-14 14:26:22', '2018-05-17 06:40:34'),
(24, 'Truyện thiếu nhi', 'truyen-thieu-nhi', NULL, NULL, 0, 1, '2018-05-14 14:27:03', '2018-05-17 06:40:30');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` tinyint(4) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `transaction_id`, `product_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(19, 13, 5, 1, 134400, '2018-05-20 20:11:08', '2018-05-20 20:11:08'),
(20, 14, 22, 5, 107520, '2018-05-26 01:30:04', '2018-05-26 01:30:04'),
(21, 15, 11, 1, 60480, '2018-05-26 01:35:14', '2018-05-26 01:35:14'),
(24, 17, 5, 2, 134400, '2018-05-28 17:48:07', '2018-05-28 17:48:07'),
(25, 18, 10, 1, 126000, '2018-05-29 17:37:55', '2018-05-29 17:37:55'),
(26, 18, 36, 1, 68000, '2018-05-29 17:37:55', '2018-05-29 17:37:55'),
(27, 19, 4, 3, 48720, '2018-05-30 08:40:54', '2018-05-30 08:40:54'),
(28, 19, 5, 1, 134400, '2018-05-30 08:40:54', '2018-05-30 08:40:54');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sale` tinyint(4) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `number` int(11) DEFAULT '0',
  `tacgia` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `head` int(11) DEFAULT '0',
  `view` int(11) DEFAULT '0',
  `hot` tinyint(4) DEFAULT '0',
  `spmuanhieu` int(11) DEFAULT '0',
  `create_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tinhtrang` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `slug`, `price`, `sale`, `image`, `category_id`, `content`, `number`, `tacgia`, `head`, `view`, `hot`, `spmuanhieu`, `create_at`, `update_at`, `tinhtrang`) VALUES
(4, 'Lớn lên trên đảo vắng', 'lon-len-tren-dao-vang', 58000, 16, '1lon-len-tren-dao-vang-tai-ban-2018-_90660_1.jpg', 15, 'Lớn Lên Trên Đảo Vắng (Tái Bản 2018) Trên đường sang châu Mỹ lập nghiệp, ông William cùng vợ và bốn cậu con trai không may bị đắm tàu và dạt lên một hoang đảo. \r\nTại đây, họ bắt đầu cuộc sống như người nguyên thủy khi phải làm nhà trong hang, đắp lũy, bắn chim, săn thú, trồng trọt, thuần hóa thú hoang... Cứ như thế, mỗi ngày trôi qua là một chuyến phiêu lưu đầy hấp dẫn nhưng cũng không kém phần hiểm nguy.\r\nNhững chi tiết thú vị về cuộc sống nơi hoang dã, những bài học bổ ích về thế giới tự nhiên đã khiến \"Lớn lên trên đảo vắng\" của Johann David Wyss trở thành một trong những tác phẩm nổi tiếng nhất mọi thời đại.', 7, 'Johann Wyss', 0, 0, 0, 3, NULL, '2018-05-29 03:10:55', NULL),
(5, 'Bốn mùa trên xứ phù tang', 'bon-mua-tren-xu-phu-tang', 168000, 20, '302087_p82412mbiatruoc.jpg', 15, 'TẬP DU KÍ ĐẦY MỸ CẢM CỦA MỘT \"PHƯỢT THỦ\" TỪNG ĐI QUA HƠN 90 QUỐC GIA\r\nCuốn sách không thể thiếu với những ai yêu thích con người và văn hóa Nhật Bản, muốn đắm mình trong nguồn mỹ cảm tuyệt vời của xứ Phù Tang. \r\n\r\nLần theo trục xoay chuyển của thời gian, đi qua các mùa để tiếp cận Nhật Bản, tập du kí của Nguyễn Chí Linh không chỉ đưa người đọc đến với những địa danh nổi tiếng mà còn đào sâu vào lịch sử, văn hóa để kể cho người đọc câu chuyện của một đất nước. Kèm theo đó, là lời giải cho câu hỏi chung của rất nhiều người: Vì sao nước Nhật, người Nhật lại được cả thế giới kính trọng?\r\n\r\nKhi giới thiệu về mình, Nguyễn Chí Linh, khá kiệm lời. Anh bảo : \"Tôi là kẻ ngoại đạo trong giới viết lách. Chỉ viết những gì từng biết và hiểu trong ánh mắt nhà quê\" . Quả vậy, Linh là một cái tên lạ trong làng sách Nhưng, với thế giới của những người yêu và mê du lịch, anh là một nhà du hành \"thứ thiệt\". Đôi chân mê dịch chuyển ấy đã được đi qua hơn 90 quốc gia trên thế giới. Những trải nghiệm của anh dễ khiến nhiều người ganh tỵ bởi anh không du lịch theo kiểu cưỡi ngựa xem hoa. Du lịch, với Linh, là hòa mình vào đời sống của người dân bản xứ, xem họ sống, thưởng thức những món họ ăn và nghe họ kể về những điều đã qua, những điều còn lại và cả những giấc mơ đất nước ấy đang hướng đến. Thế nên, khi viết về hành trình đã trải, mục đích của anh cũng rất giản đơn: viết sách để ghi lại nhật ký của mình trên đường đời.\r\n\r\nViết với tâm thế cho chính mình, điều này giúp Linh mang người đọc đến với những vùng đất mà anh đã đi qua, thả họ vào những quán ăn mình từng ngồi, chia với họ thức nhắm anh từng thử… một cách rất tự nhiên. Cũng vì vậy mà người đọc khó lòng bứt khỏi những trang viết của anh, nỗi lo của người sợ bị lỡ hành trình. Bốn mùa trên xứ phù tang, cuốn sách Nguyễn Chí Linh dùng để chạm ngõ địa hạt văn chương là một tác phẩm như vậy.\r\n\r\nMất hơn 10 năm kể từ ngày đầu tiên được đặt chân đến Nhật, Nguyễn Chí Linh mới cho ra đời Bốn mùa trên xứ phù tang. Thời điểm đó, du lịch Nhật Bản chưa cởi mở như hiện nay và không đơn giản để có tấm visa đến Nhật. Vậy mà, cái háo hức của Linh khi được đặt chân đến nơi này vẫn như còn tươi trong từng con chữ. Là những kiến trúc đặc trưng thời Edo, là thủ đô Tokyo sôi động, là những ga tàu ngầm đông như quân Nguyên Mông vỡ trận… Tất cả, phác thảo nên một Nhật Bản vừa cổ kính, vừa hiện đại. \r\n\r\nĐiểm cộng của tập sách du kí này là kho sử liệu mà tác giả đã dày công khảo cứu, tìm hiểu từ chính lời kể của những người dân bản địa. Bên cạnh đó, là những kiến thức về văn hóa mà nếu chưa đi, chưa tiếp kiến, chưa rung động… có lẽ, sẽ không thể nào chuyển tải một cách tài tình được. Ví dụ, chỉ với chiếc quạt giấy Sensu nhỏ bé, Nguyễn Chí Linh sẽ kể cho độc giả nghe được lời thì thầm của từng chiếc quạt khác nhau thông qua họa tiết mà nó mang trên mình.\r\n\r\nSong song câu chuyện văn hóa, lịch sử, là câu chuyện của con người. Thông qua những nhân vật mình từng làm việc chung, từng tiếp cận trên đất Nhật… tác giả lần lượt tháo những chiếc áo bên ngoài để người đọc tiếp cận được trái tim lẫn tính cách đặc trưng của những người đang sống trên mảnh đất vành đai núi lửa. \r\n\r\nRong chơi theo những cánh hoa anh đào trắng mỏng tang của mùa xuân, đi tìm mùa thu trở vàng trên những chiếc lá phong bé nhỏ, hay thả hồn theo ánh sáng của những chú đom đóm gọi hè, hứng trọn những hạt mưa tuyết lạnh lùng của mùa đông… nước Nhật hiện lên trong trang viết của Nguyễn Chí Linh vô cùng đẹp đẽ và đầy sức hút. Sẽ không quá lời khi nói rằng, đây là cuốn sách không thể thiếu với những ai yêu thích con người và văn hóa Nhật Bản, muốn đắm mình trong nguồn mỹ cảm tuyệt vời của xứ Phù Tang. ', 4, 'Nguyễn Chí Linh', 0, 0, 0, 3, NULL, '2018-05-29 03:08:00', NULL),
(6, 'Sự Thật Về Bébé Donge', 'su-that-ve-bebe-donge', 75000, 16, 'su-that-ve-bebe-donge.jpg', 15, 'Sự Thật Về Bébé Donge ! \"Giải phẫu\", phân tích đến kiệt cùng một cuộc hôn nhân là điều rất nhiều nhà văn từng muốn thử sức. Cũng không ít tác phẩm văn chương đồ sộ đã làm công việc ấy, nhưng Simenon, bởi một cái nhìn đặc biệt cùng tài năng hiếm có, vẫn có cách của riêng ông để tạo nên cuốn Tiểu Thuyết của riêng mình. Cuộc sống hôn nhân, bên dưới vẻ ngoài thông thường của nhàm chán, có những khía cạnh ớn lạnh, những hung hiểm khó lường do sự cộng sinh lâu dài của hai con người tạo ra. Hôn nhân, như trong thế giới của Simenon, là một địa hạt vô tận, với các bí ẩn không ngờ.', 10, 'Georges Simenon', 0, 0, 0, 0, NULL, '2018-05-16 01:57:09', NULL),
(7, 'Cô Đơn Để Trưởng Thành', 'co-don-de-truong-thanh', 82000, 16, 'co-don-de-truong-thanh.PNG', 15, 'Cô Đơn Để Trưởng Thành !\r\nBốn năm du học Mỹ của tôi đọng lại trong những trang văn này, những ghi chép về sự va chạm văn hóa ngay từ tuần đầu tiên, về sự khác biệt giữa các mối quan hệ ở Việt Nam và Mỹ, về cách nói chuyện của sinh viên bản xứ, cách họ ăn uống, tiệc tùng, về những gì tôi được dạy ở trường và cả những điều tôi phải tự học bằng trải nghiệm.\r\nDù phải đối mặt với rất nhiều khó khăn khi sống một mình ở một đất nước xa lạ, tôi vẫn biết ơn vô cùng bốn năm vừa qua. Quãng thời gian ấy có đủ cung bậc của tiếng cười và cũng đủ sắc thái của sự cô đơn. Chính trong sự cô đơn ấy mà tôi thật sự trưởng thành.', 10, 'Nguyễn Siêu', 0, 0, 0, 0, NULL, '2018-05-16 02:00:08', NULL),
(8, 'Người Khuân Đá', 'nguoi-khuan-da', 105000, 16, 'nguoi-khuan-da.PNG', 15, 'Người Khuân Đá !\r\nTình yêu cuộc sống và đạo lý ở đời trong câu chuyện bếp lửa, chuyện gia đình, chuyện của mọi người mà thấy đó chuyện của mình...\r\nHạnh phúc thay, ai yêu, và trong đêm tối thẳm\r\nĐi tìm lòng tin và gặp được yêu thương\r\nVẫn với giọng văn triết nhẹ nhàng của Chuyện trò, Sợi tơ nhện,... cuốn tản văn tiếp theo của GS. Cao Huy Thuần viết về tình yêu và cuộc sống trong đạo lý ở đời, mở rộng giao lộ liên tưởng với nhiều chiều kích mới mẻ và thấu đáo: “đạo đức Phật giáo không đặt trên tiêu chuẩn Thiện Ác, mà đặt trên an vui và đau khổ (...) Lựa chọn ít đau khổ hơn là đạo đức. Nhiều an vui hơn, là đạo đức”. Tác phẩm được viết với giọng ngọt ngào văn chương mà thâm trầm triết học. - Nhà Nghiên cứu Bùi Văn Nam Sơn', 10, 'CAO HUY THUẦN', 0, 0, 0, 0, NULL, '2018-05-16 02:03:55', NULL),
(9, 'Bên Kia Cầu Chữ Y', 'ben-kia-cau-chu-y', 85000, 16, 'ben-kia-cau-chu-y.PNG', 15, 'Bên kia cầu Chữ Y là thế, một ốc đảo xanh màu xanh của nước những dòng kênh, màu xanh của cỏ cây trên mặt đất và màu xanh của lòng người hướng vọng tương lai.  Vậy mà tôi đã bỏ đó mà đi, đi khi chưa làm được một điều gì ích lợi cho nơi đã nuôi nấng tôi thành người, đi khi nước kinh Đôi chưa cạn và những con đò vẫn tiếp tục ngày hai buổi nối Chánh Hưng với Chợ Lớn – Sài Gòn.\r\nHai mươi mốt năm dài sống đời viễn xứ, đã bao lần tôi thở dài: \r\n“Chiều chiều ra đứng ngõ sau \r\nTrông về xóm cũ ruột đau chín chiều”. \r\nNhững câu chuyện về một ốc đảo giữa Sài Gòn từ thập niên 50 đến 80 của thế kỷ 20, thời gian tôi sống và trưởng thành ở đó. Những địa điểm đơn sơ nhưng đầy tình người với những tập tục ăn sâu vào đời sống người dân địa phương. Đây đình miếu, đó chùa chiền, bến đò giữa hai con kênh nối liền cùng Sài Gòn – Chợ Lớn, nhà máy gạo, xưởng cây, lò than, lò heo, chợ Ba Đình, chợ Xóm Củi…tạo nên những nghĩa tình bình thường mà sâu đậm khó quên.', 9, 'Huỳnh Ngọc Nga', 0, 0, 0, 1, NULL, '2018-05-29 03:10:55', NULL),
(10, 'Lựa Chọn Thông Minh Trong Kinh Doanh', 'lua-chon-thong-minh-trong-kinh-doanh', 150000, 16, 'lua-chon-thong-minh-trong-kinh-doanh.jpg', 16, 'Khi gặp phải những tình huống không mong muốn trong công việc, chúng ta thường phải đứng trước các lựa chọn khó khăn. Liệu quyết định của ta có thật sự chính xác? Liệu ta có thể đánh đổi các giá trị mình đang có để thực hiện quyết định này?... Những băn khoăn và áp lực khi đứng trước các lựa chọn khiến chúng ta khó lòng thỏa mãn 100% và luôn cảm thấy “thiếu một cái gì đó”. Nhưng tại sao phải mãi lưỡng lự, đắn đo để tìm kiếm một phương án đỡ-tệ-nhất, trong khi ta có thể tự tạo ra một cách giải quyết mới và vượt trội? Chìa khóa cho vấn đề này là phương pháp , một cách hoàn toàn mới trong tư duy tạo lựa chọn được nghiên cứu, phân tích và phát triển bởi nhà tư tưởng, chiến lược gia Roger Martin.\r\nLựa Chọn Thông Minh Trong Kinh Doanh bao gồm các mô hình tư duy trực quan và những câu chuyện mới mẻ của các nhà tư tưởng. Từng chương sách đều làm sáng tỏ quá trình giải quyết vấn đề một cách sáng tạo, giúp độc giả tập luyện việc đưa ra những ý tưởng đột phá. Toàn bộ dẫn chứng trong tác phẩm đều được trích dẫn, chọn lọc từ các bài phỏng vấn trực tiếp của hai tác giả với những doanh nhân hàng đầu của các tập đoàn, tổ chức lớn như LEGO, P&G, The Vanguard...', 9, 'Jennifer Riel   Roger L. Martin', 0, 0, 0, 1, NULL, '2018-05-29 18:25:10', NULL),
(11, 'Bạn Làm Việc Vì Ai?', 'ban-lam-viec-vi-ai', 72000, 16, 'ban-lam-viec-vi-ai.jpg', 16, 'Bạn làm việc vì ai? Đối mặt với câu hỏi này, nhiều người sẽ không do dự trả lời mình làm  việc vì các ông chủ. Nhưng liệu có đúng là như vậy? Xung quanh chuyện này, chịu khó để ý tìm hiểu một chút, chúng ta hẳn sẽ phát hiện ra nhiều điều thú vị.\r\n\r\nChuyện kể rằng: Có mấy đứa trẻ trong khu bỗng nhiên kéo nhau đến nô đùa trước cửa nhà một ông lão nọ. Qua mấy ngày như thế, ông lão quả nhiên cảm thấy rất phiền, thế là ông gọi lũ trẻ đến trước nhà, đưa cho mỗi đứa mười đồng rồi nói với chúng: “Các cháu chơi đùa ở đây khiến nhà ông náo nhiệt hẳn lên, nhờ thế ông cũng cảm thấy trẻ lại không ít. Cho nên ông thưởng cho mỗi cháu mười đồng, cám ơn các cháu”. Bọn trẻ được nhận tiền, đứa nào cũng rất vui.\r\n\r\nNgày thứ hai, lũ trẻ lại đến nô đùa trước nhà ông lão như cũ. Lần này ông lão lại đi ra, cho mỗi đứa năm đồng, ông giải thích: “Ông không có tiền, chỉ còn chút bạc lẻ này”. Nhận được năm đồng tính ra cũng không đến nỗi nào, bọn trẻ vẫn cảm thấy vui. Ngày thứ ba, bọn trẻ lại chạy tới nhưng lần này ông lão chỉ cho mỗi đứa một đồng, điều này khiến bọn trẻ giận dữ vặn lại: “Suốt cả một ngày mà ông chỉ cho một đồng, tụi cháu đã vất vả như thế, thật không bõ”. Sau đó bọn trẻ nhất định thề với ông lão, từ nay chúng sẽ không bao giờ đến chơi trước nhà ông nữa.', 9, 'Ân Nhiên   An Tình Lam', 0, 0, 0, 1, NULL, '2018-05-26 01:35:31', NULL),
(12, 'Tiết Kiệm Không Khó, Theo Đó Mà Giàu!!!', 'tiet-kiem-khong-kho-theo-do-ma-giau', 64000, 16, 'tiet-kiem-khong-kho-theo-do-ma-giau.jpg', 16, 'Gom từng trăm, vài năm thành tỷ phú – Cuốn sách cung cấp cho bạn 87 tips đề hình thành tư duy tiết kiệm và cách thức tiết kiệm  hiệu quả.\r\n\r\nTiết kiệm là chuyện nói thì dễ, làm thì khó, nhất là trong thời đại con người đang sống trong một xã hội tiêu dùng ngập tràn hàng hóa như thế này. Con người dùng vật chất để khỏa lấp cho sự cô đơn, nỗi sợ hãi, cho những nỗi buồn chán trong mình, cho những ảo tưởng và tham cầu vô độ. Chưa kể, mỗi khi ra đường nghĩa là bạn đi trên hằng hà sa số những cửa hàng long lanh; mỗi phút mỗi giây mở mạng xã hội ra là vô số những trang mua hàng online tiện dụng đập vào mắt. Bạn biết làm gì đến trốn thoát nỗi buồn chán này ngoài cách mua sắm vô tội vạ đây. Vậy thì, hãy dừng lại ngay bây giờ.\r\n\r\nBởi TIẾT KIỆM không chỉ đơn giản là chắt bóp vài đồng lẻ để sống một đời an nhàn sau này, tiết kiệm còn thể hiện những phẩm chất sau ở bạn:\r\n\r\n \r\n\r\nMột người có trách nhiệm, có tầm nhìn xa rộng với cuộc đời mình.\r\nMột người sống lành mạnh, khiêm tốn, giản dị. \r\nMột người có thể đặt tâm vào từng việc làm nhỏ nhất của bản thân.\r\nMột người biết tôn trọng từng giá trị nhỏ, tôn trọng bản thân mình, không để cho vật chất chi phối thân - tâm – trí, tôn trọng những người xung quanh.\r\nMột người có thể tập trung suy nghĩ vào những việc quan trọng trong cuộc đời, không sa vào đời sống qua ngày đoạn tháng, hướng tới những cái đích cao cả và lớn lao.', 10, 'Kantana', 0, 0, 0, 0, NULL, '2018-05-17 02:39:42', NULL),
(13, 'Tứ Đại Quyền Lực', 'tu-dai-quyen-luc', 186000, 16, 'tu-dai-quyen-luc.jpg', 16, 'Cuốn sách vạch trần bản chất của Amazon, Apple, Facebook và Google\r\nĐược dịch sang 22 thứ tiếng, nằm trong danh sách “best seller” của cả New York Times và USATODAY, Tứ Đại Quyền Lực (The Four) khiến cả thế giới rúng động vì lượng sự thật nó hàm chứa trong nội dung. Quyển sách được khuyến cáo với người đọc là họ sẽ bàng hoàng không hề nhẹ trước những điều mình đọc…\r\n“Đây là quái vật của dòng sách kinh tế. Cuốn sách thiết yếu và bao quát này hết sức sắc bén, thú vị và cay nghiệt. Những nhận xét thẳng và thật của Scott Galloway chẳng kiêng dè bất cứ một đại gia công nghệ nào. Thực sự là một cuốn sách đáng đọc”, Chuyên gia tâm lý Adam Alter, giảng viên ngành tâm lý học tại trường kinh doanh Stern thuộc Đại học New York nhận xét như thế khi đọc xong Tứ Đại Quyền Lực. Đây là cuốn sách đầu tay của Scott Galloway, một giáo sư tại khoa Kinh doanh Stern thuộc đại học New York, phụ trách giảng dạy về chiến lược thương hiệu và tiếp thị số cho các học viên MBA năm thứ hai. \r\nScott là một nhà đầu tư, đã sáng lập 9 công ty bao gồm L2, Red Envelope và Prophet. Anh cũng từng lọt vào danh sách 50 Giáo sư Kinh doanh Xuất sắc nhất thế giới của trang thông tin Poets & Quants vào năm 2012. Loạt clip hàng tuần Winners and Losers của ông trên YouTube đã thu hút được hàng chục triệu lượt xem. Vậy, tác phẩm của một giáo sư “siêu” kinh doanh này hấp dẫn người đọc ở điểm nào?', 10, 'Scott Galloway', 0, 0, 0, 0, NULL, '2018-05-17 02:39:56', NULL),
(14, 'Người Truyền Cảm Hứng', 'nguoi-truyen-cam-hung', 250000, 15, 'tien-si-le-tham-duong-nguoi-truyen-cam-hung.jpg', 17, 'Sau khi cuốn Cảm xúc là kẻ thù số một của thành công của TS Lê Thẩm Dương trở thành hiện tượng xuất bản trong năm 2016-2017 với lượng phát hành lớn, theo yêu cầu của đông đảo bạn đọc, báo Sinh Viên Việt Nam – Hoa Học Trò và Langmaster tiếp tục phối hợp xuất bản cuốn sách đặc biệt Tiến sĩ Lê Thẩm Dương – Người truyền cảm hứng. Dự kiến cuốn sách sẽ được phát hành vào đúng ngày sinh nhật của TS Lê Thẩm Dương là 1/6/2018.\r\n\r\nTiến sĩ Lê Thẩm Dương – Người truyền cảm hứng do nhà báo Nguyễn Tuấn Anh – Thư ký toà soạn báo Sinh Viên Việt Nam, Trưởng ban biên soạn các cuốn sách của TS Lê Thẩm Dương: Cảm xúc là kẻ thù số một của thành công; Hồi ký Tiến sĩ Lê Thẩm Dương thực hiện. Nhà báo Nguyễn Tuấn Anh đã thực hiện phỏng vấn TS Lê Thẩm Dương trong gần 3 năm làm việc trực tiếp với ông.\r\n\r\nTiến sĩ Lê Thẩm Dương – Người truyền cảm hứng gồm 3 phần chính: Phần một, nhà báo Nguyễn Tuấn Anh trả lời 10 câu hỏi mà bạn đọc nào cũng tò mò về TS Lê Thẩm Dương, ví dụ TS Lê Thẩm Dương có phải là thầy giáo giàu nhất Việt Nam? Tại sao bài giảng của TS Lê Thẩm Dương hấp dẫn? Đệ tử số một của TS Lê Thẩm Dương là ai? TS Lê Thẩm Dương đào tạo đệ tử như thế nào? Tại sao TS Lê Thẩm Dương lại xuất bản sách? Người hâm mộ TS Lê Thẩm Dương là những ai?... Phần hai là các cuộc trò chuyện truyền cảm hứng giữa nhà báo Nguyễn Tuấn Anh và TS Lê Thẩm Dương về nhiều chủ đề trong cuộc sống, từ hướng nghiệp đến khởi nghiệp, từ học tập đến làm giàu, từ bạn bè đến gia đình, từ tình yêu đến giới tính, tình dục, từ đọc sách đến bóng đá... Phần ba của cuốn sách là những bài viết xuất sắc trong cuộc thi viết TS Lê Thẩm Dương – Người truyền cảm hứng do báo Sinh Viên Việt Nam – Hoa Học Trò và Langmaster thực hiện trong tháng 4-5/2018. Bài dự thi là những câu chuyện có thật mà các tác giả đã lấy cảm hứng từ các bài giảng của TS Lê Thẩm Dương để thay đổi bản thân. Đặc biệt, một phần nội dung của cuốn sách Hồi ký Tiến sĩ Lê Thẩm Dương được trích đăng trong cuốn sách này.', 10, 'TS Lê Thẩm Dương', 0, 0, 0, 0, NULL, '2018-05-17 02:40:05', NULL),
(15, 'Suối Nguồn Tươi Trẻ', 'suoi-nguon-tuoi-tre', 68000, 16, 'suoi-nguon-tuoi-tre.jpg', 17, 'Suối Nguồn Tươi Trẻ sẽ tiết lộ cho bạn bí quyết của sức khỏe và sinh khí của tuổi thanh xuân.\r\nSuối Nguồn Tươi Trẻ được biết đến lần đầu tiên vào năm 1939, trong cuốn sách Con mắt khải huyền của Peter Kelder -  là một bí quyết màu nhiệm vô cùng đơn giản, chỉ gồm 5 động tác, hay gọi theo cách của các Lạt ma Tây Tạng là 5 thức.\r\nBảy trung tâm năng lượng mà các Lạt ma nhắc đến chính là 7 luân xa theo quan niệm của y lý học cổ truyền phương Đông. Liên hệ với y học hiện đại phương Tây, các luân xa được một số nhà nghiên cứu coi là đối chứng siêu hình của các tuyến nội tiết, với vị trí và vai trò tương đương.\r\nNhững lợi ích thực tế của Suối Nguồn Tươi Trẻ bao gồm: sinh lực dồi dào; tinh thần minh mẫn, an nhiên, thư thái; cơ bắp săn chắc; ngủ tốt; thở sâu; sức khỏe toàn diện nâng cao, ít ốm vặt; vóc dáng trẻ trung, linh hoạt; giảm cân; cải thiện sinh hoạt vợ chồng.', 10, 'Peter Kelder', 0, 0, 0, 0, NULL, '2018-05-17 02:40:25', NULL),
(16, 'Kỹ Năng Tư Duy Logic', 'ky-nang-tu-duy-logic', 110000, 15, 'ky-nang-tu-duy-logic.PNG', 17, 'Không biết cách tư duy, không hoàn thành được công việc, con người sẽ không thể nào tồn tại trong xã hội hiện đại. Nhưng có bao giờ bạn được dạy về kỹ năng tư duy trên trường học? Liệu đến khi bạn đi làm, có cấp trên nào sẵn lòng dạy bạn cách tư duy?\r\nKhi là “lính mới”, bạn sẽ phải làm những việc bạn chưa từng làm, không thể thoái thác trách nhiệm cho ai khác. Bạn sẽ phải chủ động học hỏi và quan sát cách làm của những người có kinh nghiệm. Nhưng dù có chăm chỉ đến đâu thì khi bắt tay vào công việc bạn cũng khó lòng tránh khỏi sai sót. Tuy thế, đừng vội nản chí - vì tình trạng này có thể được cải thiện nhanh chóng nếu bạn học được cách tư duy hợp lý.\r\nCuốn sách \"Kỹ năng tư duy logic\" được viết để làm sáng tỏ những thắc mắc “Làm thế nào để tư duy tốt?” hay “Phải luyện tập tư duy như thế nào?” của bạn. Cuốn sách được trình bày súc tích, đi từ tổng quan đến chi tiết, giúp bạn nắm bắt được nội dung cốt lõi của 5 kỹ năng tư duy dành cho doanh nhân một cách dễ dàng. Bên cạnh đó, tác phẩm còn bật mí những cách áp dụng kỹ năng tư duy vào công việc để hiệu quả lao động của bạn được nâng lên mức cao nhất.\r\nTìm hiểu cuốn sách này, bạn sẽ thu lại được những lợi ích sau:\r\nCó thể xây dựng ý kiến và thảo luận với khách hàng, cấp trên, đồng nghiệp và cấp dưới; hiểu sâu những vấn đề được thảo luận\r\nCó thể đưa ra những chỉ thị đích xác cho cấp dưới và các thành viên trong nhóm\r\nCó thể hoàn thành một bài thuyết trình hoặc một bản tài liệu tác động đến đối phương\r\n...\r\nDù bạn làm bất cứ ngành nghề gì, bất cứ vị trí gì, bạn vẫn có thể yên tâm áp dụng những phương pháp có trong \"Kỹ năng tư duy logic\", vì những quy tắc cơ bản của tư duy trong mọi trường hợp đều giống nhau.', 10, 'Shibamoto Hidenori', 0, 0, 0, 0, NULL, '2018-05-17 02:40:32', NULL),
(17, 'Hoa Sen Trên Tuyết', 'hoa-sen-tren-tuyet', 68000, 16, 'hoa-sen-tren-tuyet.jpg', 17, 'Trên nền câu chuyện cuộc đời của nhân vật có thật, triệu phú Alan Havey, Hoa sen trên tuyết gieo vào độc giả nhiều điều phải nghĩ. Xuất thân từ một gia đình nghèo ở Mỹ và hiểu rõ giá trị của đồng tiền. Alan Havey đã nỗ lực rất nhiều để làm việc, học tập và đạt được những thành công nhất định: biệt thự lộng lẫy bên bờ Michigan, căn nhà nghỉ mát trên núi Mt Vernon, du thuyền, tài khoản kếch xù trong ngân hàng và một cô vợ đẹp như diễn viên điện ảnh… Cuộc sống đầy đủ cứ thế diễn ra cho tới khi những biến cố lần lượt đến trong cuộc đời: ông phát hiện bị ung thư; một số khoản đầu tư bị thua lỗ và sự nghiệp của ông có chiều hướng đi xuống. Và, người vợ - cũng là niềm tự hào của ông với mọi người đòi ly hôn để chia tài sản…\r\nTại sao ông lại phải gánh chịu những việc như vậy trong khi ông đã dành phần lớn thời gian, công sức của mình để làm việc và nỗ lực? Ông để vợ ông có cuộc sống tốt nhất nhưng cuối cùng ông vẫn bị bỏ rơi với hàng loạt cáo buộc? Thực sự, sống tốt, sống lành là tốt hay không? Câu trả lời  rằm ở hành trình ông rời bỏ những bế tắc, theo lời khuyên của một người bạn, để thực hiện một chuyến du lịch “không mục đích” đến Dharamsala - nơi Đức Đạt Lai Lạt Ma và hàng chục nghìn người Tây Tạng đang tị nạn. Cả cuốn sách là những ghi chép tỉ mỉ về hành trình của ông, những người ông gặp để từ đó, mang đến lời giải đáp cho câu hỏi của chung rất nhiều người: “Ý nghĩa của cuộc sống này là gì?”.', 10, 'Nguyên Phong', 0, 0, 0, 0, NULL, '2018-05-17 02:44:10', NULL),
(18, 'Phát Minh Cuối Cùng', 'phat-minh-cuoi-cung', 185000, 16, 'phat-minh-cuoi-cung.jpg', 18, 'Trí tuệ nhân tạo giúp bạn chọn những cuốn sách bạn mua, những bộ phim bạn xem, và thậm chí những người bạn hẹn hò. Nó có trong điện thoại thông minh của bạn và tới đây sẽ lái chiếc xe của bạn. Nó thực hiện hầu hết các giao dịch trên Wall Street, và kiểm soát cơ sở hạ tầng điện, nước và giao thông. Nhưng trí tuệ nhân tạo cũng có thể đe dọa sự tồn tại của con người.\r\n\r\nChỉ trong một thập kỷ, AI có thể đạt ngang ngửa và sau đó vượt qua trí thông minh của con người. Các công ty và cơ quan chính phủ đang rót hàng tỷ đô-la để thu được một AI với trí thông minh ở cấp độ con người. Một khi AI đã phát triển đến mức này, các nhà khoa học lập luận rằng, nó sẽ có những động lực sống giống như con người. Chúng ta có thể sẽ buộc phải cạnh tranh với một kẻ thù ngoan cường hơn, mạnh mẽ hơn và khác biệt hơn chúng ta tưởng tượng.\r\n\r\nThông qua việc phỏng vấn với những người có tầm nhìn xa về công nghệ, các cơ quan giám sát công nghiệp, và những hệ thống AI, cuốn sách Phát minh cuối cùng khám phá những nguy cơ của việc theo đuổi AI cao cấp. Cho đến nay, trí thông minh của con người không có đối thủ. Liệu chúng ta có thể cùng tồn tại với những thứ mà trí tuệ của chúng ta trở nên nhỏ bé hơn hẳn? Và liệu chúng sẽ cho phép chúng ta cùng tồn tại?\r\n\r\n“Cuốn sách trần trụi về chủ đề quan trọng nhất của thế kỷ này và có thể còn hơn thế - sự tồn vong của nhân loại. Ước gì nó là khoa học viễn tưởng nhưng tôi biết rằng không phải vậy”. ', 8, 'James Barrat', 0, 0, 0, 0, NULL, '2018-05-17 02:46:12', NULL),
(19, 'Tế Bào Gốc', 'te-bao-goc', 199000, 16, 'te-bao-goc.jpg', 18, 'Tế bào gốc là cuốn sách của Ts Paul Knoepfler rất hấp dẫn cho những ai đang muốn tìm hiểu về Tế Bào Gốc, Với sự dẫn dắt của tác giả qua góc nhìn rất khách quan bạn sẽ thu thập được nhiều kiến thức đa chiều để tự mình đánh giá và định hướng cho chính mình và người thân khi muốn tìm một liệu pháp tế bào gốc khả thi nhằm cải thiện sức khỏe hay chất lượng cuộc sống. \r\n \r\nCuốn sách này đề cập đến những khía cạnh vô cùng lý thú nhưng còn gây tranh cãi dữ dội trong lĩnh vực trị liệu bằng tế bào gốc. Paul Knoepfler sẽ đưa người đọc vào thế giới tế bào gốc thông qua sự hướng dẫn của một chuyên gia ở tầm quốc tế . Tế bào gốc đang góp phần tạo nên một cuộc cách mạng trong y học. \r\n \r\nNhững câu hỏi thường gặp nhất về tế bào gốc sẽ được tác giả lần lượt giải đáp: Tế bào gốc là gì? Liệu tế bào gốc có thể chữa được các bệnh như Alzheimer, đa xơ cứng hay chứng tự kỷ? Liệu tế bào gốc có thể làm tôi trông trẻ trung hơn hay thậm chí là trẻ mãi không? Những liệu pháp này có an toàn hay tốn kém không? \r\nSau khi gấp sách lại, độc giả sẽ hiểu được tầm quan trọng của lĩnh vực tế bào gốc trong tương lai gần, cũng như triển vọng của liệu pháp tế bào gốc, thứ sẽ thay đổi cuộc sống và thế giới chúng ta\r\nTác giả của sách Tế Bào Gốc', 8, 'Paul Knoepfler', 0, 0, 0, 0, NULL, '2018-05-17 02:48:27', NULL),
(20, 'Vạn Vật Vận Hành Như Thế Nào', 'van-vat-van-hanh-nhu-the-nao', 599000, 16, 'van-vat-van-hanh-nhu-the-nao.jpg', 18, 'Từ Radar tới Robot, Cối xoay gió tới Wifi, đây là một bản hướng dẫn trực quan đưa ta tới thế giới của các cỗ máy.\r\n- Một quyển sách tham khảo ĐẦY ĐỦ THÔNG TIN, KỸ CÀNG CHỈ DẪN và CỰC KỲ GIẢI TRÍ dành cho độc giả ở mọi lứa tuổi.\r\n- Quyển sách ĐOẠT GIẢI này đã được HIỆU ĐÍNH và BỔ SUNG đầy đủ để bao gồm tất cả các CÔNG NGHỆ SỐ TỐI TÂN NHẤT.\r\n- Chúng ta hãy theo chân loài MA MÚT lông xù bước vào một tác phẩm hướng dẫn được ĐỊNH HÌNH RẤT THÔNG MINH, để tiếp cận các nguyên lý và nguyên tắc hoạt động của HÀNG TRĂM LOẠI MÁY MÓC TRÊN ĐỜI.\r\n \r\nVạn Vật Vận Hành Như Thế Nào ? mô tả phần lớn các phát minh của thế giới hiện đại, giúp ta có cái nhìn sâu hơn về cơ chế hoạt động của các vật dụng tưởng chừng rất tầm thường. Được lồng ghép với một nhân vật thô kệch mà dễ thương (voi ma-mút lông), dưới lời dẫn truyện của một nhà phát minh ngờ nghệch nhưng đầy tham vọng thời tiền sử, cuốn sách này hứa hẹn là tác phẩm gần gũi với mọi lứa tuổi độc giả đam mê tìm tòi và có óc phiêu lưu hài hước.\r\n \r\nĐây sẽ là món quà tặng tuyệt vời cho mọi độ tuổi, miễn là có đam mê tìm tòi học hỏi về khoa học, kỹ thuật, cơ khí, điện tử, hoặc những độc giả chán chường với những cuốn sách khô khan về các lĩnh vực trên. Ta có thể bắt đầu đọc ở bất kỳ nơi nào của sách.', 5, 'David Macaulay', 0, 0, 0, 0, NULL, '2018-05-17 02:58:23', NULL),
(21, 'KHÁM PHÁ RỪNG', 'kham-pha-rung', 120000, 15, 'kham-pha-rung.jpg', 18, 'Một dạng \"bách khoa thư\" về rừng trên thế giới; Cho bạn cảm nhận được về những khu rừng; Giúp bạn cảm thấy thoải mái hòa mình vào thiên nhiên tươi đẹp, hoang sơ...\r\n \r\nBởi những khu rừng rậm luôn là một trong số khu vực rộng lớn và bí ẩn của thế giới; luôn khiến cho người ưa khám phá cũng như các nhà khoa học phải tò mò; có hệ động / thực vật phong phú và phát triển...Những khu rừng ẩn tàng ngàn điều kỳ lạ, có thể là mối nguy hiểm khôn lường và cũng có thể là những điều cực kỳ thú vị!\r\n \r\n\r\nBằng cách nào để biết được tuổi của cây?\r\nHiệu ứng nhà kính là gì?\r\nTại sao nấm luôn mọc cùng chỗ?\r\nTại sao lợn rừng lại tắm bùn?\r\nNai sừng tấm có biết bơi không?\r\nCó phải sóc chỉ ăn quả phỉ?\r\nẾch nhái rừng nhiệt đới có nguy hiểm không?\r\nCó loài cây ăn thịt không?\r\nBằng cách nào nhận ra được dấu chân hươu?\r\nCây nào có thể sống cắm rễ trong nước? \r\nCó loài cây ăn thịt không?\r\n.....\r\nTất cả các câu hỏi này, và nhiều câu hỏi khác nữa, sẽ tìm thấy câu trả lời trong quyển sách này. Với hình minh họa phong phú, cuốn sách sẽ đưa bạn khám phá các khu rừng trên thế giới cùng hệ động thực vật của chúng.', 8, 'Henry Eynard', 0, 0, 0, 0, NULL, NULL, NULL),
(22, 'Révolution - Cách Mạng', 'revolution---cach-mang', 128000, 16, 'revolution-cach-mang.gif', 19, 'Cách Mạng được xuất bản ngày 24-11-2016, đã bán được gần 200.000 bản và là một trong những quyển sách bán chạy nhất nước Pháp trong năm 2016. Không phải ngẫu nhiên mà bản quyền dịch thuật cuốn sách này bán được cho hơn 20 quốc gia, một con số chưa từng có đối với một chính trị gia người Pháp.  Điều gì khiến cuốn sách nhỏ này hấp dẫn đến vậy?\r\n \r\nNgày 14-5-2017, một người đàn ông mới 39 tuổi tuyên thệ trước điện Elysée trong buổi lễ nhậm chức Tổng thống Pháp. Đó chính là Emmanuel Macron, tổng thống thứ 25 và cũng là tổng thống trẻ nhất của nước Pháp từ trước đến nay.\r\n \r\nCuộc đời riêng và sự nghiệp chính trị của Macron kể từ khi ông nổi lên từ cuộc chạy đua vào chức tổng thống đã trở thành tâm điểm của giới truyền thông. Xuất thân từ tỉnh lẻ, gia đình căn bản theo nghề y, không hề có truyền thống chính trị, cưới một người vợ là cô giáo của ông và hơn ông 24 tuổi, đã có 3 con riêng. Đam mê văn chương từ nhỏ, lớn lên theo học triết rồi lại chuyển hướng sang ngành hành chính công. Thế rồi đột ngột từ bỏ lĩnh vực hành chính công để theo đuổi một sự nghiệp rất thành công trong lĩnh vực tài chính ngân hàng. Sau đó tham gia vào chính phủ của Tổng thống François Hollande, làm Phó Tổng Thư ký Văn phòng Tổng thống rồi Bộ trưởng Bộ Kinh tế, Công nghiệp và Kỹ thuật số.\r\n \r\nTháng 4-2016, Macron bỗng nhiên quyết định từ chức bộ trưởng và thành lập phong trào Tiến bước! (En Marche!), một đảng chính trị mà theo ông là theo đường lối ôn hòa, không phải cánh tả cũng không phải cánh hữu. Sau một cuộc chạy đua tranh cử ngoạn mục, ông đã đánh bại ứng viên cực hữu Marine Le Pen, bước lên tột đỉnh vinh quang trong lĩnh vực chính trị: Trở thành chủ nhân của điện Elysée.', 3, 'Emmanuel Macron', 0, 0, 0, 1, NULL, '2018-05-26 01:35:59', NULL),
(23, 'Hồi Ký Bà Đầm Thép', 'hoi-ky-ba-dam-thep', 480000, 15, 'margaret-thatcher-hoi-ky-ba-dam-thep.PNG', 19, 'Margaret Thatcher là nhân vật chính trị quyền lực nhất Vương quốc Anh vào cuối thế kỷ 20. Khó có vị thủ tướng nào trong thời hiện đại tìm cách thay đổi đất nước và vị thế của nó trên trường quốc tế một cách triệt để như bà từng làm. Đây là cuốn hồi ký về một phụ nữ phi thường kiêm chính trị gia lỗi lạc. Cuốn sách kể về những năm tháng trưởng thành, sự hình thành nhân cách và giá trị của bà, mô tả chi tiết những kinh nghiệm đã đưa bà đến đỉnh cao trong thế giới chính trị vốn chỉ dành cho đàn ông.\r\n\r\nBà đã cho thấy một góc nhìn riêng về các sự kiện lớn trong suốt mười một năm làm thủ tướng, bao gồm chiến tranh Falkland, xung đột Anh-Ireland, khủng hoảng đình công trên quy mô cả nước, những diễn biến của Chiến tranh Lạnh. Nhận định của Thatcher về những người mà bà từng gặp trong suốt thời gian cầm quyền - từ những chính khách, thủ tướng, tổng thống cho tới các đồng nghiệp trong Nội các - luôn toát lên vẻ chân thực. Mạnh mẽ, thẳng thắn và hấp dẫn, vị nữ lãnh đạo này đã để lại một di sản không thể xóa nhòa.\r\n\r\n“Margaret Thatcher là người đã định hình nên nền chính trị hiện đại của nước Anh. Dù đứng ở phe nào, không ai có thể phủ nhận được rằng, với tư cách là Thủ tướng, bà đã để lại dấu ấn đặt biệt và lâu dài trên đất nước mà bà phụng sự”. - Nick Clegg, nguyên Phó Thủ tướng Anh\r\n\r\n“Là con gái của một người bán hàng và là nữ Thủ tướng đầu tiên của nước Anh, bà đã trở thành hình mẫu để cho các con gái tôi thấy rằng, không rào cản nào là không thể vượt qua”. - Barack Obama, nguyên Tổng thống Mỹ\r\n\r\n“Bà là nhà lãnh đạo truyền cảm hứng, người luôn giữ nguyên tắc và chèo lái đất nước mình với sự tự tin và lương thiện. Bà là một hình mẫu đẹp đẽ về sức mạnh và cá tính, và là một đồng minh tuyệt vời, người thúc đẩy mối quan hệ đặc biệt giữa nước Mỹ và nước Anh” - George Bush, nguyên Tổng thống Mỹ', 5, 'Margaret Thatcher', 0, 0, 0, 0, NULL, NULL, NULL),
(24, 'Sự Thật Về Donald Trump', 'su-that-ve-donald-trump', 149000, 16, 'su-that-ve-donald-trump1.jpg', 19, 'Đây là cuốn sách New York Times Bestseller ĐẦU TIÊN tiết lộ mối liên hệ giữa Donald Trump với Liên Bang Nga - thứ đã làm tốn không ít giấy mực của giới truyền thông toàn cầu.\r\n\r\n \r\n\r\n\r\nTrong Sự Thật Về Donald Trump, những khía cạnh gay cấn và riêng tư nhất của nhân vật thời đại này sẽ được tiết lộ một cách cẩn trọng, dựa trên những tài liệu vững chắc. Thông qua hàng chục năm nghiên cứu các bài phỏng vấn, báo cáo tài chính, văn kiện tòa án... liên quan đến Donald Trump; tác giả - nhà báo David Cay Johnston cung cấp cho độc giả cái nhìn sâu sắc nhất về người đàn ông khiến cả thế giới phải dõi theo.\r\n\r\n \r\n\r\n\r\nĐúng như tiêu đề của nó, tất cả những sự thật về Donald Trump, như lịch sử gia đình phức tạp của ông, các câu chuyện hôn nhân đầy toan tính, sự nghiệp kinh doanh lắm thăng trầm, đế chế Trump hùng mạnh nhưng tai tiếng... đều sẽ được phơi bày trong tác phẩm. Và đương nhiên, chúng ta không thể không bàn tới việc Trump đã lôi kéo rất nhiều cá nhân quyền lực vào quỹ đạo của bản thân như thế nào. Johnston tâp trung phân tích hành vi ứng xử của Trump, để người đọc có thể phần nào hiểu được tính cách của con người kỳ lạ này.\r\n\r\n \r\n\r\n\r\nTrump cáo già trong truyền thông, luôn sôi sục tinh thần kinh doanh, và có sức ảnh hưởng chính trị không hề nhỏ, ngay cả khi chưa lên làm Tổng thống. Vì nhiều lý do, cuộc đời ông trở thành một chuỗi tranh luận với đủ loại quan điểm trái chiều. Nhưng bạn thì sao, bạn nghĩ như thế nào về Donald Trump? Hãy cầm lên Sự Thật Về Donald Trump và tìm kiếm câu trả lời của riêng mình.', 5, 'David Cay Johnston', 0, 0, 0, 0, NULL, NULL, NULL),
(25, 'Einstein Cuộc Đời Và Vũ Trụ', 'einstein-cuoc-doi-va-vu-tru', 265000, 16, 'einstein-cuoc-doi-va-vu-tru.jpg', 19, 'Cuốn sách cũng chỉ ra và làm rõ những chặng trên con đường khoa học của Einstein, cho thấy những suy tư và trăn trở của ông để đưa ra những lý thuyết vật lý làm thay đổi toàn bộ nền vật lý thế kỷ XX, cũng như cuộc tranh luận của ông với các nhà cơ học lượng tử.\r\nEinstein đã tư duy như thế nào khi thực hiện nghiên cứu khoa học? Điều gì làm nên sự vĩ đại nơi ông? Một người lận đận với cuộc hôn nhân bị gia đình phản đối, một nhân viên cấp bằng sáng chế hạng ba, thậm chí còn không tìm nổi một chân trợ giảng ở bất cứ trường đại học nào - làm sao một người như vậy lại có thể trở thành nhà khoa học vĩ đại nhất, bộ óc vĩ đại nhất của nhân loại trong thế kỳ XX?\r\nNhững góc khuất và rất nhiều chi tiết thú vị khác về cuộc đời Einstein đã được tác giả hé lộ và làm sáng tỏ trong Einstein: Cuộc Đời Và Vũ Trụ. Bằng tư liệu trước đây chưa từng công bố, Issacson đã kể lại toàn bộ cuộc đời Einstein, nhà khoa học vĩ đại thế kỷ XX, kể cả những khiếm khuyết rất con người của ông\r\nTác giả đã lột tả được cá tính, tư tưởng chính trị và những đặc điểm trong trí tuệ, nhân cách của Einstein một cách sinh động.\r\n \r\nEinstein: Cuộc Đời Và Vũ Trụ - Nhận định:\r\n“Với tài kể chuyện vô song, Isaacson đã làm nên kỳ tích là vừa giữ được tượng đài Einstein, vừa mang lại cho ông hơi thở sống động, giúp ta cảm thấy như thể ông đang bước đi giữa chúng ta. Đúng là một tác phẩm tuyệt vời.”  Doris Kearns Goodwin, tác giả cuốn Team of Rivals [Đội của các đối thủ], No Ordinary Time [Không có thời gian thông thường], và là tác giả đoạt giải Pulitzer về lịch sử.\r\n“Isaacson đã làm được một việc xuất sắc là truyền tải được cả phần con người lẫn các chi tiết thú vị trong cuộc đời khoa học của Einstein. Đây không chỉ là một cuốn tiểu sử hấp dẫn, mà mỗi trang luôn mời chào ta đọc trang tiếp theo, mà còn là một tác phẩm tiêu biểu hàng đầu trong thể loại phi hư cấu.” Lawrence M. Krauss, Giáo sư vật lý theo chương trình Ambrose Swasey tại Đại học Case Western Reserve và là tác giả của cuốn Hiding in the Mirror [Trốn trong gương]\r\n“Isaacson đã viết một cuốn tiểu sử chính xác, hấp dẫn và thú vị, trình bày thật khéo các văn liệu lịch sử và đưa đến nhiều hiểu biết mới mẻ về cuộc đời cũng như sự nghiệp của Einstein” Diana Kormos Buchwald, chủ biên cuốn Tuyển tập các bài nghiên cứu của Albert Einstein và là Giáo sư lịch sử tại Caltech.', 5, 'Walter Isaacson', 0, 0, 0, 0, NULL, NULL, NULL),
(26, 'Ăn Gì Cho Không Độc Hại', 'an-gi-cho-khong-doc-hai', 70000, 15, 'an-gi-cho-khong-doc-hai_90117_1.jpg', 20, 'Câu chuyện thú vị và bổ ích về thực dưỡng, ăn chay, hay detox... nhìn từ góc độ khoa học và thực tiễn đời sống, môi trường, được thể hiện bằng giọng văn hài hước và sắc sảo.\r\n \r\nTác giả vốn là cây viết chủ lực của trang soi.com, viết về ẩm thực và văn hóa ', 10, 'Pha Lê', 0, 0, 0, 0, NULL, NULL, NULL),
(27, 'Bí Ẩn Của Lão Hóa', 'bi-an-cua-lao-hoa', 125000, 16, 'bi-an-cua-lao-hoa_74313_1.jpg', 20, 'Từ trước đến nay, trên thị trường Việt Nam có rất nhiều sách hướng dẫn bí quyết trẻ đẹp. Thế nhưng, những thông tin thật sự hữu ích, cụ thể giúp duy trì tuổi xuân theo thời gian vẫn không có nhiều.\r\n \r\nGiờ đây, quyển sách “The Aging Myth” (tạm dịch: “Bí ẩn của lão hóa”) với phiên bản tiếng Việt đã xuất hiện tại Việt Nam. Đây chính là cơ hội để độc giả trong nước được tiếp cận nguyên nhân cốt lõi gây ra lão hóa và tìm hiểu về công nghệ ứng dụng mang tầm quốc tế, giúp con người tận hưởng cuộc sống trẻ trung dài lâu. \r\n \r\nĐược New York Times bình chọn là quyển sách bán chạy nhất và phổ biến trên toàn thế giới, “Bí ẩn của lão hóa” hoàn toàn xứng đáng được độc giả lựa chọn. Tác giả cuốn sách “Bí ẩn của lão hóa\" chính là Tiến sĩ Joseph Chang - Trưởng Ban Khoa Học kiêm Phó Chủ tịch Điều hành, phát triển sản phẩm của Tập đoàn Nu Skin, sẽ đưa người đọc khám phá “lãnh địa” của lão hóa, bí ẩn từ hàng ngàn năm đối với con người, nay đã được “vén màn” và tìm ra cách khắc phục. \r\n \r\n“Bí ẩn của sự lão hóa” được giới khoa học đánh giá là một “quan điểm tuyệt vời về sự lão hóa”, phù hợp cho tất cả mọi người, từ trẻ đến già với mục tiêu đọc, khám phá và thay đổi cuộc sống ngay từ bây giờ. Trong sách, Tiến sĩ Joseph Chang đã hé mở những bí ẩn của quá trình lão hóa “Tất cả là nằm trong bộ gen của chúng ta” và giải thích ageLOC ứng dụng công nghệ biến đổi gen tuyệt vời ra sao để các bạn có thể tận hưởng cuộc sống trẻ trung dài lâu như mong đợi.\r\n \r\nBí ẩn của lão hóa là cuốn sách  dành cho bất kỳ ai quan tấm đến sự lão hóa một cách khỏe mạnh. Lão hóa không đơn thuần là quá trình hao mòn và hư hỏng bị động theo thời gian, mà còn là một quá trình sinh học chủ động, được điều chỉnh bởi một số gien chủ đạo. Vai trò then chốt của biểu hiện gien đối với sự lão hóa được Joe Chang giải thích cấp độ mà độc giả có thể dễ dàng lĩnh hội được.', 10, 'Joe Chang', 0, 0, 0, 0, NULL, NULL, NULL),
(28, '15 Phút Tập Lưng', '15-phut-tap-lung', 114000, 16, '15-phut-tap-lung-kem-1-dvd-_67143_1.jpg', 20, 'Với những người làm việc trong môi trường công sở, việc ngồi hàng tiếng trước máy tính dễ gây ra những cơn đau nhức ở vùng lưng, thoát vị đĩa đệm cột sống lưng… Giải quyết điều này thật sự không có. Chỉ cần duy trì những động tác trong 15 Phút Tập Lưng, bạn đọc đã có thể tư chăm sóc bản thân tại nhà hay ngay tại công ty, trong những phút nghỉ ngơi giữa ngày làm việc mệt mỏi, căng thẳng.\r\n \r\nTheo Suzanne Martin giáo viên thể dục thẩm mỹ tại Trường Y khoa thể thao Hoa Kỳ, tác giả có cơ duyên kỳ lạ với tập sách này. Bà kể: “Trong suốt hơn 25 năm qua. Tôi đã từng bị vẹo cột sống mức độ nhẹ, nó khiến cuộc sống của tôi trở nên khó khăn trong các hoạt động hàng ngày. Nhưng nhờ sự tập luyện chăm chỉ cùng với những bài tập đơn giản trong cuốn sách này mà bệnh vẹo cột sống của cô đã phục hồi và chấm dứt hẳn”. Vì điều này mà Suzanne Martin đam mê và lấy làm động lực để nghiên cứu sâu hơn về vấn đề sức khỏe thể hình của con người.\r\n \r\nQua tập sách, tác giả chia sẻ những bí quyết và hướng dẫn những bài tập đơn giản, cụ thể giúp bạn phòng tránh, cũng như làm vơi nhẹ những triệu chứng thường xảy ra đối với lưng. Theo Suzanne Martin, chỉ cần 15 Phút Tập Lưng mỗi ngày sẽ giúp bạn cải thiện sức khỏe hơn và có môt sức sống bền bỉ, dai dẻo và tràn đầy năng lượng sống.cơ thể không chỉ cần được vận động, luyện tập thường xuyên, mà còn cần được cung cấp đầy đủ dưỡng chất, có chế độ nghỉ ngơi hợp lý để phục hồi. Duy trì sự cân bằng này, sẽ làm cho cuộc sống trở nên có ý nghĩa hơn và chúng ta sẽ luôn cảm thấy hạnh phúc.\r\n \r\nSách do First News thực hiện, thiết kế ấn tượng như một quyển lịch để bàn để người đọc có thể luôn đặt bên cạnh mình, như một cẩm nang tự chăm sóc sức khỏe.', 5, 'Suzanne Martun P.T', 0, 0, 0, 0, NULL, NULL, NULL),
(29, 'IELTS Test Practice Book 2', 'ielts-test-practice-book-2', 268000, 10, 'ielts-test-practice-book-kem-cd-_76383_1.jpg', 21, 'Practical and strategic, this IELTS test practice book aims to help you achieve the highest score on the IELTS test.\r\n\r\nAs well as six complete IELTS tests, this book has:\r\n\r\n- A review of some of the reading strategies introduced in IELTS Reading\r\n\r\n- Sample answers to all writing tasks, with comments, analysis, and vocabulary excercises\r\n\r\n- Sample answers to some questions in the first part of the Speaking Test, similary with comments, analysis, and vocabulary excercises\r\n\r\n- Listening scripts', 5, 'Andrew Guilfoyle', 0, 0, 0, 0, NULL, NULL, NULL),
(30, 'Tiếng Hàn Dành Cho Người Việt', 'tieng-han-danh-cho-nguoi-viet', 70000, 16, 'tieng-han-danh-cho-nguoi-viet-tai-ban-2017-_73986_1.jpg', 21, 'Cuốn sách Tiếng Hàn dành cho người Việt với nội dung chi tiết, dễ hiểu nhằm hướng dẫn bạn đọc từng bước làm quen với tiếng Hàn qua các bài đàm thoại. Với cách sử dụng cách phiên âm sang tiếng Việt theo giọng phát âm chuẩn của người Hàn để độc giả dễ dàng đọc theo. Khả năng đàm thoại của các bạn sẽ lưu loát hơn và chuẩn xác hơn khi kết hợp với băng cassette do người Hàn đọc. Cuối mỗi bài học là Phần Tìm hiểu văn hóa Hàn Quốc giới thiệu những nét văn hóa đặc trưng của Hàn Quốc giúp các bạn có những ứng xử văn hóa phù hợp và hiểu thêm về đất nước này.\r\n\r\n \r\n\r\nTiếng Hàn dành cho người Việt là một tài liệu học tập và tham khảo cần thiết và hữu ích với những đặc điểm nổi bật sau:\r\n\r\n- Giới thiệu các mẫu câu đàm thoại kèm theo những ví dụ minh họa giúp bạn nắm vững cấu trúc câu\r\n\r\n- Mỗi mẫu câu đều có hướng dẫn cách sử dụng trong những tình huống phù hợp\r\n\r\n- Các bạn có thể làm quen với nền văn hóa phong phú và đa dạng của đất nước này qua phần “Tìm hiểu văn hóa Hàn Quốc”\r\n\r\n- Nội dung trình bày rõ ràng, khoa học và dễ hiểu giúp các bạn dễ dàng tham khảo', 10, 'Mỹ Trinh - Minh Khang', 0, 0, 0, 0, NULL, NULL, NULL),
(31, 'Để Nói Thông Thạo Tiếng Anh', 'de-noi-thong-thao-tieng-anh', 88000, 16, 'de-noi-thong-thao-tieng-anh_73649_1.jpg', 21, 'Phương pháp mới học và nhớ tiếng Anh hiệu quả nhất\r\n\r\nTrong thời đại hiện nay, tiếng Anh đã và đang là một hành trang không thể thiếu của bất kỳ ai muốn phát triển sự nghiệp và vươn tầm ra thế giới. Nhưng việc học tiếng Anh ở Việt Nam vẫn đang là một vấn đề nan giải, rất nhiều người đang loay hoay tìm cách nào để có thể học tiếng Anh tốt, giao tiếp thành thạo để tự tin trong công việc và cuộc sống. Chính vì vậy, việc giao tiếp bằng tiếng Anh, đặc biệt là kỹ năng nói rất cần thiết cho những người định hướng tương lai của mình trong một thế giới hội nhập. Một ví dụ cụ thể là từ năm 2015, Việt Nam tham gia cộng đồng kinh tế ASEAN (AEC) điều này có nghĩa là những người Việt Nam trình độ tiếng anh tốt có thể làm bất cứ nơi nào tại ASEAN. Tuy nhiên, thông thường đa số người học tiêng Anh ở Việt Nam đều thiếu tự tin khi giao tiếp bằng ngôn ngữ này.\r\n\r\n“Để nói thông thạo tiếng anh” hỗ trợ người học có thể nói tiếng anh cơ bản trong thời gian ngắn nhất với châm ngôn. Học dễ, Nói nhanh tiếng Anh. Cuốn sách sẽ cung cấp các chủ đề thông dụng trong giao tiếp hằng ngày, nhất là cho những người có ý định đi du học hoặc làm việc tại các cơ sở cung cấp dịch vụ trong và ngoài nước.\r\n\r\nĐể nói thông thạo tiếng Anh do Tiến sĩ Nguyễn Đắc Tâm – Phó chủ tịch Hội đồng quản trị trường Đại Học Văn Lang cùng nhóm giảng viên khoa ngoại ngữ biên soạn. Với mong muốn gửi đến tất cả bạn đọc. Đặc biệt là các em sinh viên có thể giao tiếp tiếng Anh một cách dễ dàng, lưu loát và tự tin.\r\n\r\nCuốn sách được chia làm 4 phần chính: Những câu nói thông dụng trong sinh hoạt hằng ngày; câu hỏi bắt đầu bằng “WH” và “H”; Tiếng anh dành cho du lịch; và phần Phụ lục.\r\n\r\nMong rằng với cuốn sách nhỏ bé này có thể đóng góp thiết thực vào việc phát triển kỹ năng nói tiếng Anh cho người học.', 10, 'Tiến sĩ Nguyễn Đắc Tâm', 0, 0, 0, 0, NULL, NULL, NULL),
(32, 'Bão Lửa U23 – Thường Châu Tuyết Trắng', 'bao-lua-u23-thuong-chau-tuyet-trang', 119000, 16, 'bao-lua-u23.jpg', 22, 'Như chúng ta đều biết, những thành quả mà Đội tuyển U23 Việt Nam đạt được tại VCK U23 châu Á 2018 đã mang lại những cảm xúc khó quên trong lòng mỗi người con đất Việt. Những cảm hứng tuyệt vời đó thật hiếm hoi và đáng quý, cần được lan tỏa, lưu giữ theo thời gian, để luôn  nhắc nhở chúng ta rằng, người Việt giàu tinh thần dân tộc, tinh thần thượng võ, giàu ý chí, nghị lực, đặc biệt là trước những thử thách, nghịch cảnh. Thế hệ trẻ Việt Nam hoàn toàn có thể chinh phục những đỉnh cao trong nhiều lĩnh vực khác như Kinh tế, Giáo dục, Khoa học Kỹ thuật… như trong thể thao như U23 đã làm được.\r\n\r\n \r\n\r\nXuất phát từ nguồn cảm hứng tuyệt vời mà sự kiện U23 mang lại và lan tỏa trên cả nước trong thời gian qua, chúng tôi  – Ban Dự án Bão Lửa của Sống – Thương hiệu sách Tác giả Việt của Alphabooks đã triển khai thực hiện cuốn sách Bão Lửa U23 – Thường Châu Tuyết Trắng nhằm tri ân tập thể cán bộ, cầu thủ U23 Việt Nam – những anh hùng trên sân cỏ, HLV Park Hang Seo cùng các thành viên Ban huấn luyện, các ông bầu Đoàn Nguyên Đức, Đỗ Quang Hiển… những người đã tâm huyết gây dựng, tận lực cống hiến cho thắng lợi vang dội của bóng đá Việt Nam trong sự kiện vừa qua.\r\n\r\n \r\n\r\nCuốn sách tập hợp gần 50 bài viết chất lượng, cô đọng và sâu sắc của nhiều cây bút thể thao có tiếng như Trương Anh Ngọc, Phạm Trung Tuyến, Hoàng Linh, Nguyên Khôi, Quốc Việt…; của các tác giả, nhà văn, nhà nghiên cứu thuộc nhiều lĩnh vực khác nhau, như Chu Văn Sơn, Nguyễn Quang Thiều, Đinh Hoàng Anh, Trần Vinh Dự, Nguyễn Cảnh Bình,... đặc biệt là có sự tham gia của Lê Huy Khoa – Trợ lý ngôn ngữ HLV Park Hang Seo.\r\n\r\n \r\n\r\nĐã có rất nhiều những bài báo viết về chiến công của đội tuyển U23 trong quãng thời gian ngắn ngủi vừa qua. Nhưng cuốn sách này khác hẳn với những gì đã được viết ra, đơn giản vì nó không chỉ cô đọng lại từng khoảnh khắc của những trận đấu đã qua, những hiệu ứng cảm xúc kỳ diệu U23 đã mang lại cho cả dân tộc, mà còn cung cấp những cái nhìn rất sâu về từng khía cạnh của những nguyên nhân và chân dung những con người đã làm nên chiến thắng, những khó khăn đã trải qua, những rắc rối gặp phải trên đường vào chung kết, nhưng cũng không quên nhắc đến con đường tiếp theo của bóng đá Việt Nam sau thành công này. ', 10, 'Nhiều Tác Giả', 0, 0, 0, 0, NULL, '2018-05-17 06:02:18', NULL),
(33, 'Chuyện Diệu Kỳ Của Bọ Chét Leo Messi', 'chuyen-dieu-ky-cua-bo-chet-leo-messi', 117000, 16, 'chuyen-dieu-ky-cua-bo-chet-leo-messi_76329_1.jpg', 22, 'Cuốn sách kể về những câu chuyện kỳ diệu của Cậu Bé Vàng Leo Messi. Ngay từ nhỏ, Messi đã luôn mơ ước được là người kế cận của cựu danh thủ Maradona huyền thoại. Cậu sớm bộc lộ tài năng và được gia nhập học viện đào tạo cầu thủ trẻ La Masia của đội bóng hàng đầu thế giới Barcelona. Bằng nỗ lực và quyết tâm của mình, Leo Messi đã hiện thực hóa được giấc mơ thời thơ ấu của mình', 10, 'Michael Part', 0, 0, 0, 0, NULL, NULL, NULL),
(34, 'Những Câu Chuyện Lịch Sử Khác Thường - World Cup', 'nhung-cau-chuyen-lich-su-khac-thuong---world-cup', 30000, 16, 'nhung-cau-chuyen-lich-su-khac-thuong-world-cup_28325_1.jpg', 22, 'Cuốn sách này được viết bởi một người Anh nên đương nhiên, nó sẽ bắt đầu với thông tin chính người Anh đã đem môn thể thao tuyệt vời nhất này đến với thế giới, và Liên đoàn bóng đá Anh được thành lập ngay từ năm 1863. Và không phải người Anh, mà chính đối thủ truyền thống của họ bên kia bờ biển, mới là người đặt bút bắt đầu câu chuyện về World Cup. Vâng, chính người Pháp mới là những người giữ vai trò chủ chốt trong việc thành lập Liên đoàn bóng đá thế giới FIFA vào năm 1904. Cùng đọc “Những câu chuyện lịch sử khác thường – World cup” để khám phá những thông tin thú vị mà bạn chưa biết về những kì World Cup đầy sôi động.', 15, 'David Arscott - Mark Bergin', 0, 0, 0, 0, NULL, NULL, NULL),
(35, 'Phân Tích Dữ Liệu Với R - Hỏi Và Đáp', 'phan-tich-du-lieu-voi-r---hoi-va-dap', 118000, 16, 'phan-tich-du-lieu-voi-r-hoi-va-dap_76473_1.jpg', 23, 'Cuốn sách bạn đang cầm trên tay là một nỗ lực nhằm giới thiệu các phương pháp phân tích mô hình và thống kê phổ biến. các phương pháp gồm mô hình hồi qui tuyết tính, hồi qui logistic, phân tích tổng hợp (meta - anlysis), mô hình phân tích sống còn (survival anlysis), phương pháp phân tích chuỗi dữ liệu theo thời gian (time series data), phương pháp bayes, phương pháp bootstrap... Với nội dung đa dạng như thế, cuốn sách này sẽ giúp ích cho các nhà nghiên cứu, giảng viên cao đẳng và đại học, sinh viên, hay bất cứ ai muốn học về thống kê và phương pháp phân tích dữ liệu.\r\n\r\n \r\n\r\nNgôn ngữ được sử dụng trong sách là R. Có nhiều lý do R được chọn làm ngôn ngữ để thực hiên các phương pháp trên, kể cả sự miễn phí và năng lực khoa học. Không giống như các phần miềm thương mại khác đều tốn khá  nhiều tiền, R hoàn toàn miễn phí. Bất cứ ai ở bất cứ nơi nào trên thế giới có truy cập mạng internet điều có thể tải R về máy tính, tốn vài phút cài đặt , và bắt đầu sử dụng. Trước đây, chỉ có một thiểu số nhà nghiên cứu (chủ yếu là các nước tiên tiến) mới có điều kiện sử dụng phần mềm thống kê, nhưng từ ngày có R thì bất cứ ai cũng đều có điều kiện áp dụng những phương pháp phân tích tinh vi nhất và hiện đại nhất cho nghiên cứu khoa học và phân tích dữ liệu. Do đó, sự ra đời của R đã làm cuộc cách mạng thống kê ở qui mô toàn cầu. R còn \"dân chủ hóa\" việc tiếp cận các phương pháp phân tích dữ liệu tiên tiến nhất trên thế giới.', 10, 'Nguyễn Văn Tuấn', 0, 0, 0, 0, NULL, NULL, NULL),
(36, 'Tớ Học Lập Trình', 'to-hoc-lap-trinh', 80000, 15, 'to-hoc-lap-trinh_67076_1.png', 23, ' \r\nCẩm nang hướng dẫn hoàn chỉnh và đơn giản nhất dành cho bạn trẻ bắt đầu học lập trình\r\n \r\nNgôn ngữ lập trình Scratch đặc biệt phù hợp cho bạn trẻ mới học, vì tính tương tác trực quan, đồ họa sống động, ra sản phẩm liền tay mà vẫn đảm bảo khoa học và liên thông tri thức sau này.\r\n \r\nChỉ cần nắm và kéo các khối lệnh đầy màu sắc có sẵn để lắp ghép thành một kịch bản điều khiển các đối tượng trên màn hình.\r\n \r\nKhông có những dòng lệnh logic khô cứng và dễ lỗi, những khái niệm kỹ thuật khó hiểu, những quy tắc luật lệ chằng chịt và mệt mỏi trong các ngôn ngữ lập trình kiểu người lớn.', 14, 'Louie Stowell   ', 0, 0, 0, 1, NULL, '2018-05-29 18:25:10', NULL);
INSERT INTO `product` (`id`, `name`, `slug`, `price`, `sale`, `image`, `category_id`, `content`, `number`, `tacgia`, `head`, `view`, `hot`, `spmuanhieu`, `create_at`, `update_at`, `tinhtrang`) VALUES
(37, 'Hướng dẫn tự học Microsoft Word 2013', 'huong-dan-tu-hoc-microsoft-word-2013', 68000, 16, 'huong-dan-tu-hoc-microsoft-word-2013_21601_19493.jpg', 23, 'Cuốn sách gồm những nội dung chính:\r\n   -  Nhập, biên tập và đọc sửa văn bản\r\n\r\n   -  Chỉnh sửa cấu trúc và diện mạo của văn bản\r\n\r\n   -  Tổ chức thông tin trong các cột và bảng\r\n\r\n   -  Thêm các phần tử đồ họa đơn giản\r\n\r\n   -  Xem trước, in và phân phối các tài liệu\r\n\r\n   -  Chèn và chỉnh sửa các sơ đồ\r\n\r\n   -  Chèn và chỉnh sửa các biểu đồ\r\n\r\n   -  Tổ chức và sắp xếp các nội dung\r\n\r\n   -  Liên kết với thông tin nội dung\r\n \r\nĐây sẽ là cuốn tài liệu hữu ích cho bạntrong lĩnh vực Tin học văn phòng.', 10, 'VL.COMP', 0, 0, 0, 0, NULL, NULL, NULL),
(38, 'Tự Học Adobe Photoshop CS6', 'tu-hoc-adobe-photoshop-cs6', 70000, 16, 'tu-hoc-adobe-photoshop-cs6-tap-3_14979_13033.jpg', 23, 'Khi bạn muốn chỉnh sửa hình ảnh trở nên sinh động, đẹp mắt hơn hoặc đơn giản chỉ muốn sửa chữa vài lỗi nhỏ trong ảnh thì chắc hẳn sự lựa chọn và nghĩ tới đầu tiên là Adobe Photoshop. Với phiên bản phần mềm Adobe Photoshop CS6 mới nhất đã tạo ra bước đột phá và nó đã trở thành một tiêu chuẩn tuyệt vời của công nghệ phần mềm kỹ thuật số. Bạn sẽ có được một khả năng mới để chỉnh sửa hình ảnh và cải thiện hiệu suất công việc ngay cả khi bạn sử dụng Photoshop chuyên hay không chuyên.\r\nNhằm đáp ứng nhu cầu tự học của bạn đọc, bộ sách Tự học Photoshop CS6 gồm 4 tập được biên soạn từ cơ bản đến nâng cao giúp các bạn làm quen các tính năng của chương trình, nâng cao kỹ năng tạo vùng chọn, kỹ thuật chỉnh sửa ảnh và thiết kế quảng cáo, thiết kế giao diện web...cần thiết trong lĩnh vực Nhiếp ảnh, Đồ họa.\r\nĐể các bạn mới làm quen với Photoshop cũng có thể tham khảo tài liệu, TẬP 1 và TẬP 2 chủ yếu trình bày khái quát giao diện chương trình và tính năng của các công cụ tạo vùng chọn và vùng chọn, các khái niệm về layer, các kỹ thuật tách nền, vẽ và tô màu trong Photoshop, các bộ lọc hiệu chỉnh ảnh,... Đến với tập 3 này chúng ta sẽ bắt đầu khám phá các Plug-in hỗ trợ trong Photoshop CS6, đồng thời tìm hiểu thêm về cách dựng phim và dựng hình 3D trong Photoshop CS6.\r\n \r\nCuốn sách \"Tự Học Adobe Photoshop CS6 - Tập 3\" gồm các nội dung chính sau:\r\n \r\nPhần 1: Giới thiệu một số Plug-in và bộ lọc trong Photoshop CS6\r\nPhần 2: Cách dựng phim và dựng hình 3D\r\nPhần 3: Bài tập tổng hợp\r\n \r\nMỗi quyển sách được tặng kèm 1 đĩa CD chứa dữ liệu thực hành và những hướng dẫn giúp các bạn tự học dễ dàng.', 12, 'Nhóm VHP', 0, 0, 0, 0, NULL, NULL, NULL),
(39, 'Bảng Điều Khiển Con Người', 'bang-dieu-khien-con-nguoi', 59000, 16, 'bang-dieu-khien-con-nguoi_90673_1.jpg', 24, ' \r\nHai anh em sinh đôi giống nhau như đúc Fred và Ellie cùng mê chơi điện tử. Một ngày, cả hai gặp người bí ẩn và được tặng một bảng điều khiển thần kì có khả năng biến điều ước thành hiện thực.\r\nNhững khoảnh khắc xuất thần trong truyện có thể làm bạn chóng mặt, những tình huống ngộ nghĩnh chắc chắn khiến bạn bật cười. Bao điều không tưởng ở ngoài đời không còn xa vời trong thế giới bay bổng của những trò chơi với bảng điều khiển thần kì.', 11, 'David Baddiel   Jim Field', 0, 0, 0, 0, NULL, NULL, NULL),
(40, 'Tranh Truyện Dân Gian Việt Nam: Tấm Cám', 'tranh-truyen-dan-gian-viet-nam-tam-cam', 15000, 16, 'tranh-truyen-dan-gian-viet-nam-tam-cam-tai-ban-2018-_90332_1.PNG', 24, 'Những câu chuyện dân gian nuôi dưỡng tâm hồn các em, giúp các em biết học điều hay lẽ phải, yêu cái thiện, ghét cái xấu và trân trọng truyền thống cha ông. Bộ sách Tranh truyện dân gian Việt Nam là món quà ý nghĩa với những câu chuyện được tuyển chọn và biên soạn kĩ lưỡng. Phần tranh vẽ minh họa sinh động, gần gũi giúp các em dễ dàng hơn trong việc tiếp cận và ghi nhớ câu chuyện.\r\n \r\nCha mất sớm, Tấm bị mẹ kế và cô em Cám hành hạ đủ điều. Tủi phận nhưng Tấm chẳng biết phải làm sao. Ngày nọ, Bụt thương  cô gái hiền thảo, đã tặng cho Tấm những món quà đặc biệt. Nhờ vậy, dẫu phải trải qua nhiều sóng gió, cuối cùng Tấm vẫn trở về, sống đầm ấm và hạnh phúc. Câu chuyện “Tấm Cám” gói ghém ước nguyện bao đời của dân ta, rằng cái thiện sẽ thắng cái ác, ở hiền sẽ gặp lành.Những câu chuyện dân gian giúp các em giàu thêm mơ ước, biết sống đẹp và trân trọng truyền thống cha ông. Cùng tìm đọc hơn 100 cuốn Tranh truyện dân gian Việt Nam do NXB Kim Đồng ấn hành!', 20, 'Hồng Hà   Mai Long', 0, 0, 0, 0, NULL, NULL, NULL),
(41, 'Đoàn Tàu Trong Mơ', 'doan-tau-trong-mo', 88000, 16, 'doan-tau-trong-mo_90641_1.jpg', 24, 'Mạnh mẽ và truyền cảm từng lời thơ, cẩn trọng và bay bổng từng trang tranh vẽ, Đoàn Tàu Trong Mơ là một trong những cuốn Sách Thiếu Nhi tuyệt vời cho tuổi ấu thơ. Mỗi trang sách cuốn em vào chuyển động không gian và guồng quay cấp tập. Những giọt mồ hôi lao động đang hối hả tuôn trong đêm...\r\nNhận xét dành cho cuốn sách Đoàn Tàu Trong Mơ\r\n“Lấp lánh như vì sao sáng trong đêm, đặc biệt dành cho những ai yêu thích tàu xe.” - School Library Journal\r\n“Bọn trẻ sẽ hò reo vì cuốn sách này, cả những lúc cầm nó trước khi đi ngủ hay khi đang giờ đọc sách.” - Booklist\r\n“Một câu chuyện đáng đọc trước giờ đi ngủ, dành cho các em bé yêu những đoàn tàu và yêu thương loài vật.” - Publishers Weekly\r\n“Cả tính năng thực tế lẫn tính cách tưởng tượng của những đoàn tàu được kết hợp tài tình trong cuốn sách tranh vui tươi.” - The Wall Street Journal', 11, 'Sherri Duskey Rinder', 0, 0, 0, 0, NULL, NULL, NULL),
(42, 'Manchester United - Thiên Sử Về Quỷ Đỏ', 'manchester-united---thien-su-ve-quy-do', 159000, 16, 'manchester-united-thien-su-ve-quy-do_27065_1.jpg', 22, 'Cuốn sách ghi lại cuộc hành trình phi thường của câu lạc bộ được sinh ra trong các công trình đường sắt của Newton Heath đã trở thành nhà vô địch châu Âu. Các giai đoạn quan trọng trong lịch sử của Manchester United qua cách vẽ trên những hồi ức của mọi người từ các cầu thủ và các nhà quản lý cho tới người hâm mộ và nhân viên, Jim đã khai thác và tái hiện một lịch sử hấp dẫn của câu lạc bộ bóng đá giỏi nhất nước Anh này.\r\n\r\n \r\n\r\nCác mốc giai đoạn quan trọng trong lịch sử của Manchester United được tái hiện: những cầu thủ tử nạn trong thảm họa máy bay tại Munich năm 1958 là phần tốt nhất của toàn bộ các “đứa trẻ” của Busby; trở thành đội bóng Anh đầu tiên để giành chiến thắng các giải châu Âu trong năm 1968 (với Bobby Charlton và George Best); sự thống trị của các câu lạc bộ trong giải Ngoại hạng; việc bán gây tranh cãi để ông trùm Mỹ Malcolm Glazer.\r\n\r\n \r\n\r\nNhững ai đã từng bị hút hồn bởi lối chơi tấn công đầy mê hoặc của những con quỷ đỏ thành Old Trafford chắc hẳn không thể bỏ lỡ một lịch sử huy hoàng, một chặng đường vinh quang nhưng đầy chông gai của Manchester United. Với một thành tích đáng nể: 19 lần vô địch bóng đá Anh, 11 lần đoạt Cúp FA và 3 lần vô địch UEFA Champions League, đội bóng áo đỏ thực sự xứng đáng trở thành một trong những đội bóng thành công nhất nước Anh. Thông qua cuốn sách này, độc giả sẽ được lần lượt trải qua những thăng trầm trong lịch sử vĩ đại của Manchester United, thấu hiểu những khó khăn cũng như nỗ lực không mệt mỏi của họ để liên tục được xướng tên trên bảng vàng.    ', 15, 'Jim White', 0, 0, 0, 0, NULL, NULL, NULL),
(43, 'Người Sài Gòn Bất Đắc Dĩ', 'nguoi-sai-gon-bat-dac-di', 200000, 16, 'nguoi-sai-gon-bat-dac-di_75172_1.jpg', 15, 'Sách tập hợp những truyện ngắn và ký viết về miền đất Nam Bộ, vùng ruộng đồng sông nước của nhà văn Võ Đắc Danh. Bàng bạc trong các truyện là nỗi niềm của những người nông dân đã một đời thân cò lặn lội, oằn vai dưới gánh nặng đau khổ của chiến tranh hôm qua, rồi lại vì miếng cơm manh áo hôm nay nhưng vẫn bất khuất, trung kiên chống lại áp bức, bất công.', 16, 'Võ Đắc Danh', 0, 0, 0, 0, NULL, '2018-05-19 03:33:24', NULL),
(44, 'Trên Đường Băng', 'tren-duong-bang', 80000, 15, '75476_tren-duong-bang-tony-buoi-sang_44722_1.jpg', 15, 'Trên đường băng là tập hợp những bài viết được ưa thích trên Facebook của Tony Buổi Sáng. Nhưng khác với một tập tản văn thông thường, nội dung các bài được chọn lọc có chủ đích, nhằm chuẩn bị về tinh thần, kiến thức…cho các bạn trẻ vào đời. Sách gồm 3 phần: “Chuẩn bị hành trang”, “Trong phòng chờ sân bay” và “Lên máy bay”, tương ứng với những quá trình một bạn trẻ phải trải qua trước khi “cất cánh” trên đường băng cuộc đời, bay vào bầu trời cao rộng.\r\n\r\n \r\n\r\nNhững bài viết của Tony sinh động, thiết thực, hài hước và xuất phát từ cái tâm trong sáng của một người đi trước nhiều kinh nghiệm. Anh viết về thái độ với sự học và kiến thức nói chung, cách ứng phó với những trắc trở thử thách khi đi làm, cách sống hào sảng nghĩa tình văn minh…truyền cảm hứng cho các bạn trẻ sống hết mình, trọn vẹn từng phút giây. Tuy đối tượng độc giả chính mà cuốn sách hướng đến là các bạn trẻ, nhưng độc giả lớn tuổi hơn vẫn có thể đọc sách để hiểu và có cách hỗ trợ con em mình một cách đúng đắn, chứ không “ủ” con quá kỹ để rồi tạo ra một thế hệ yếu ớt, không biết tự lập. Những người đi làm nhiều năm đọc sách cũng có thể nhìn lại con đường đi của mình, tự ngẫm đó đã phải là con đường mình muốn đi chưa, bởi thay đổi không bao giờ là quá muộn.', 15, ' Tony Buổi Sáng', 0, 0, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `amount`, `users_id`, `status`, `created_at`, `updated_at`, `note`) VALUES
(8, 147840, 8, 1, '2018-05-17 07:37:16', '2018-05-17 07:37:42', 'có'),
(9, 244860, 12, 0, '2018-05-18 16:56:45', '2018-05-18 16:56:45', 'có'),
(10, 246620, 9, 0, '2018-05-19 04:19:09', '2018-05-19 04:19:09', 'có'),
(13, 147840, 9, 1, '2018-05-20 20:11:08', '2018-05-26 00:59:41', 'oke'),
(14, 591360, 9, 1, '2018-05-26 01:30:04', '2018-05-26 01:35:59', 'oke'),
(15, 66528, 9, 1, '2018-05-26 01:35:14', '2018-05-26 01:35:31', 'có'),
(17, 295680, 9, 1, '2018-05-28 17:48:07', '2018-05-29 03:08:00', 'yes'),
(18, 213400, 17, 1, '2018-05-29 17:37:55', '2018-05-29 18:25:10', ''),
(19, 308616, 19, 0, '2018-05-30 08:40:54', '2018-05-30 08:40:54', 'oke');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phone`, `address`, `password`, `avatar`, `status`, `token`, `create_at`, `update_at`) VALUES
(8, 'lê kim cường', 'lekimcuong@gmail.com', '123456789', 'Thanh Hóa', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, NULL, NULL),
(9, 'nguyễn trung quy', 'nguyentrungquy96@gmail.com', '0968478588', 'Vĩnh Phúc', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, NULL, NULL),
(10, 'thanh tùng', 'thanhtung@gmail.com', '0964205132', 'Hà Tây', '123456', NULL, 1, NULL, NULL, NULL),
(11, 'trần minh chính', 'tranminhchinh96@gmail.com', '0984562503', 'Hải Hậu - Nam Định', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, NULL, NULL),
(12, 'trung quy', 'tuoidoimuoi96@gmail.com', '0968478588', 'Vĩnh Phúc', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, NULL, NULL),
(15, 'trungquy', 'trungquy@gmail.com', '123456789', 'viet nam', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, NULL, NULL),
(16, 'sinh viên quy', 'nguyentrungquy95@gmail.com', '0968478588', 'Vĩnh Phúc', 'f4cc399f0effd13c888e310ea2cf5399', NULL, 1, NULL, NULL, NULL),
(17, 'sinh viên quy', 'nguyentrungquy92@gmail.com', '0968478588', 'vinh phúc', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, NULL, NULL),
(18, 'sinh viên a', 'tieuhoc@gmail.com', '0968478588', 'vinh phuuc', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, NULL, NULL),
(19, 'nguyentrungquy', 'daihoc@gmail.com', '096847555', 'ha noi', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blsanpham`
--
ALTER TABLE `blsanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sp` (`id_sp`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `blsanpham`
--
ALTER TABLE `blsanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blsanpham`
--
ALTER TABLE `blsanpham`
  ADD CONSTRAINT `FK_blsanpham_product` FOREIGN KEY (`id_sp`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_orders_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_orders_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `FK_transaction_user` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
