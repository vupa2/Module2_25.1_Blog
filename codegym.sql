-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 29, 2021 at 03:01 PM
-- Server version: 10.3.29-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codegym`
--
CREATE DATABASE IF NOT EXISTS `codegym` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `codegym`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Tin Chung'),
(2, 'Kinh Tế'),
(3, 'Chính trị'),
(4, 'Giải Trí'),
(5, 'Công Nghệ'),
(6, 'Thể thao'),
(7, 'Đời Sống');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `body`, `created_at`) VALUES
(1, 21, 1, 'Hỏi nhanh - đáp gọn với tác giả &#39;Phương Đông lướt ngoài cửa sổ&#39;', '<p><strong>Paul Theroux là nhà văn du lịch người Mỹ. Tác phẩm \"Phương Đông lướt ngoài cửa sổ\" của ông được đánh giá là một trong những tiểu thuyết du ký hay nhất mọi thời đại.</strong></p>\r\n\r\n<p style=\"text-align:center;\"><img alt=\"\" src=\"http://localhost/codegym/public/upload/963287064609a723dc42da.jpeg\" style=\"height:313px;width:500px;\" /></p>\r\n\r\n<p style=\"text-align:center;\"><em>Tác phẩm Phương Đông lướt ngoài cửa sổ của Paul Theroux được đánh giá rất cao ở thể loại du ký. Ảnh: AP.</em></p>\r\n\r\n<p>Paul Theroux sinh năm 1941 tại Mỹ và là nhà văn nổi tiếng trong mảng sách du lịch. Nét đặc sắc trong các tác phẩm của Paul Theroux là những cảm xúc chân thật của khát khao khám phá, muốn dấn thân chứ không đơn thuần kể lại hành trình.</p>\r\n\r\n<p>Tác phẩm <em>Phương Đông lướt ngoài cửa sổ </em>của Paul Theroux được tờ <em>Telegraph</em> đánh giá là một trong 20 cuốn sách du ký hay nhất mọi thời đại.</p>\r\n\r\n<p>Thậm chí, Jennifer Schuessler, phóng viên của tờ <em>The New York Times</em> còn nói: “Theroux đã khởi xướng cho cuộc bung nở của thể loại du ký hiện đại với <em>Phương Đông lướt ngoài cửa sổ</em>, cuốn sách đạt thành công lớn lao và vang dội, ghi lại cuộc hành trình dài 40 nghìn cây số xuyên châu Á của ông”.</p>\r\n\r\n<p>Trang <em>Penguin UK</em> đã có cuộc phỏng vấn nhanh Paul Theroux để tìm hiểu thêm thói quen, sở thích cũng như những trải nghiệm đẹp của ông.</p>\r\n', '2020-05-11 07:13:00'),
(2, 22, 2, 'Vì sao giá thép tăng phi mã', '<p><strong>Đà phục hồi kinh tế ở nhiều nước đẩy giá hàng hóa tăng mạnh. Cùng với đó, lo ngại về nguy cơ thiếu hụt nguồn cung thép và quặng sắt ở Trung Quốc đã thúc đẩy hoạt động đầu cơ.</strong></p>\r\n\r\n<p>Theo <em>Bloomberg</em>, nhu cầu thép tăng mạnh khi các nền kinh tế trên toàn thế giới vực dậy từ cuộc khủng hoảng Covid-19. Trong khi đó, những công ty khai thác lớn nhất thế giới bị cản trở bởi một số vấn đề hoạt động và nguồn cung quặng bị thắt chặt.</p>\r\n\r\n<p>Chính quyền Trung Quốc vừa công bố một loạt biện pháp nhằm thắt chặt kiểm soát công suất sản xuất thép, làm dấy lên lo ngại về nguồn cung. Nhà phân tích Daniel Briesemann của Commerzbank AG nhận định triển vọng dài hạn đối với giá kim loại là \"quá tốt\" và giá sẽ tăng cao hơn nữa trong vài năm tới.</p>\r\n\r\n<p>\"Những xu hướng khử cacbon ở nhiều quốc gia - bao gồm chuyển sang xe điện, mở rộng năng lượng gió và năng lượng mặt trời - có khả năng tạo ra thêm nhu cầu đối với kim loại\", ông nhận định.</p>\r\n', '2020-11-03 18:03:08'),
(3, 23, 1, '&#39;Ở Amazon, đôi lúc chúng tôi tuyển người chỉ để sa thải&#39;', '<p><strong>Một số quản lý tại Amazon cho biết họ thuê nhân viên chỉ để sa thải. Họ làm việc này để đạt chỉ tiêu \"thay máu nhân sự\" mà công ty này đề ra theo kế hoạch.</strong></p>\n\n<p>Chỉ tiều về tỉ lệ nghỉ việc mỗi năm tại Amazon luôn khiến các nhà quản lý đau đầu. Để đạt được mục tiêu này họ phải thuê thêm nhân viên và sau đó sa thải.</p>\n\n<p style=\"text-align:center;\"><img alt=\"\" src=\"http://localhost/codegym/public/upload/959718986609a72bcdc65a.jpg\" style=\"height:375px;width:500px;\" /></p>\n\n<p style=\"text-align:center;\"><em>Chân dung CEO của Amazon, Jeff Bezos. Ảnh: Insider.</em></p>\n\n<p>Hình thức này được gọi là “thuê để sa thải”. Các nhà quản lý sẽ thuê những người họ có ý định đuổi việc trong vòng một năm chỉ để đạt được tỉ lệ thay máu nhân sự hàng năm của công ty. Chỉ số này được gọi với cái tên hoa mỹ là \"tiêu hao không hối tiếc\" (URA).“Nhiều lúc chúng tôi phải thuê những người mà mình biết trước sẽ đuổi họ. Chúng tôi làm việc này chỉ để bảo vệ phần còn lại của nhóm”, một người quản lý giấu tên nói.</p>\n\n<p>Tuy nhiên, người phát ngôn của Amazon phủ nhận việc công ty thuê nhân viên với ý định đuổi việc họ và không sử dụng cụm từ \"thuê để sa thải\". Tuy vậy, hình thức này tồn tại ở một số bộ phận của Amazon, nơi yêu cầu các nhân viên quản lý phải đạt được chỉ số URA đề ra mỗi năm.</p>\n\n<p>Theo các tài liệu từ <em>Insider</em>, những giám đốc điều hành cấp cao nhất tại Amazon, tuân thủ chặt chẽ các mục tiêu URA được đề ra. Ngay cả Andy Jassy, người kế vị Jeff Bezos cũng dự kiến thay thế 6% bộ phận của mình.</p>\n\n<p>Các quản lý bị áp lực phải đạt những mục tiêu này bằng cách này hay cách khác. Cụ thể, nếu một nhóm chỉ đạt được URA là 3% trong năm 2020 trong khi mục tiêu là 5%, họ sẽ phải đạt được 7% ở năm kế tiếp.</p>\n\n<p>Theo bản ghi nhớ nội bộ, để ép nhân viên nghỉ việc, Amazon có chương trình đào tạo mang tên Focus. Đại diện Amazon cho biết công ty không có mục tiêu cụ thể về việc có bao nhiêu nhân viên sẽ được nhận vào Focus.</p>\n\n<p>Theo báo cáo trước đây từ <em>Insider</em>, các mục tiêu trong kế hoạch huấn luyện của Focus là không thực tế. Những người không qua được khóa huấn luyện này sẽ được đưa vào giai đoạn tiếp theo là Pivot, nơi quyết định việc họ rời khỏi công ty.</p>\n\n<p>Nhân viên của Amazon cho biết các quản lý có thể đưa bất cứ ai vào khóa Focus, điều này khiến họ không thế ứng tuyển vào những vị trí khác trong công ty. Hậu quả là việc tự nguyện từ chức hoặc buộc phải thôi việc.</p>\n', '2021-02-22 20:04:55'),
(4, 22, 5, 'Người bán hàng online phải làm gì sau bản cập nhật iOS 14.5?', '<p>Chuyên gia nhận định doanh nghiệp quảng cáo online cần đa dạng hóa nền tảng, tận dụng tối đa các công cụ tiếp thị để tổ chức, chăm sóc, tiếp cận lại khách hàng cũ.</p>\r\n\r\n<p>\"Các nền tảng quảng cáo đang đứng ở thế bị động trong cuộc chiến Apple-Facebook. Họ buộc phải chấp nhận thay đổi để thích ứng với cập nhật mới\", ông Trần Quốc Kỳ, sáng lập công ty quảng cáo truyền thông Gigan JSC chia sẻ với <em>Zing</em>.</p>\r\n\r\n<h3><strong>Đa dạng hay là \'chết\'?</strong></h3>\r\n\r\n<p>Cuối tháng 4, Apple chính thức ra mắt bản cập nhật iOS 14.5, yêu cầu ứng dụng phải xin phép người dùng trước khi theo dõi hoạt động của họ. Điều này đã trực tiếp hạn chế dòng dữ liệu Facebook nhận được từ ứng dụng để xây dựng hồ sơ người dùng. Những hồ sơ này cho phép nhà quảng cáo của Facebook nhắm mục tiêu hiệu quả hơn.</p>\r\n\r\n<p>Thay đổi quyền riêng tư của Apple khiến các ứng dụng như Facebook không thể gửi mã định danh cho khách hàng nếu người đó không cho phép. Từ đó, khả năng chứng minh tính hiệu quả của quảng cáo Facebook bị giảm sút. Ví dụ: Facebook giờ đây không thể cung cấp nhiều thông số cho nhà quảng cáo như có bao nhiêu người xem quảng cáo trong tuần đã thực sự mua sản phẩm.</p>\r\n\r\n<p>\"Nếu xét về mặt chuyên môn, mức độ ảnh hưởng tương đối đáng kể. Cụ thể, việc hạn chế trong thu thập dữ liệu người dùng, mất đi tập khách hàng trước kia, hệ thống báo cáo chậm hơn khiến bị động trong việc tối ưu chi phí lẫn tính hiệu quả. Ngoài ra, còn có nhiều thay đổi về logic và thuật toán tiếp thị mà các nhà quảng cáo phải mất nhiều thời gian để kịp thích ứng\", ông Kỳ cho biết.</p>\r\n', '2021-02-17 09:05:50'),
(5, 21, 3, 'Chiến hạm Mỹ nổ 30 phát súng khi bị nhiều tàu Iran áp sát', '<p>Một tàu Tuần duyên Mỹ đã bắn cảnh cáo sau khi bị 13 tàu của Hải quân Lực lượng Vệ binh Cách mạng Hồi giáo Iran (IRGCN) áp sát trên eo biển Hormuz.</p>\r\n\r\n<p>Ông John Kirby, người phát ngôn Bộ Quốc phòng Mỹ, cho biết hôm 10/5 rằng đây là lần thứ hai kể từ tháng 4, tàu quân sự nước này phải nổ súng cảnh cáo hành vi thiếu an toàn của tàu Iran tại khu vực.</p>\r\n\r\n<p>Dù vậy, trong một năm qua, các sự việc tương tự giữa hai bên đã tạm lắng xuống, theo <em>Reuters</em>.</p>\r\n\r\n<p style=\"text-align:center;\"><img alt=\"\" src=\"http://localhost/codegym/public/upload/1558869793609a73f3aa523.jpeg\" style=\"height:333px;width:500px;\" /></p>\r\n\r\n<p style=\"text-align:center;\"><em>Tàu USS Monterey của Mỹ neo đậu tại cảng Constanta trên Biển Đen hồi tháng 7/2011. Ảnh: Reuters.</em></p>\r\n\r\n<p>Nhằm cảnh cáo và buộc các tàu Iran rời đi, tàu tuần tra lớp Island Maui của lực lượng Tuần duyên Mỹ đã bắn hơn 30 phát từ súng máy 50 caliber, ông Kirby nói.Theo đại diện Lầu Năm Góc, hành động này diễn ra sau khi các tàu của Iran áp sát 6 tàu quân sự Mỹ ở khoảng cách dưới 140 m. Hạm đội Mỹ lúc đó có sự góp mặt của tàu USS Monterey, với nhiệm vụ hộ tống tàu ngầm tên lửa dẫn đường Georgia.</p>\r\n\r\n<p>Người phát ngôn Bộ Quốc phòng Mỹ khẳng định: “Điều này rất quan trọng ... và họ (các tàu Iran) đã hành động rất hung hăng\". Ông cho biết thêm rằng số lượng tàu Iran lần này đã nhiều hơn lần áp sát trước.</p>\r\n\r\n<p>Vào tháng 4, một tàu quân sự của Mỹ, đi cùng với một tàu tuần tra của nước này, cũng đã bắn cảnh cáo sau khi bị ba tàu IRGCN tiến tới gần khi hai tàu trên đang hoạt động ở Vùng Vịnh.</p>\r\n\r\n<p>Vụ việc này xảy ra trong bối cảnh Iran và các cường quốc đang tìm cách thúc đẩy nỗ lực nhằm đưa Washington và Tehran trở lại thỏa thuận hạt nhân năm 2015.</p>\r\n\r\n<p>Tuần trước, các quan chức Mỹ đã đến Vienna để tham dự vòng đàm phán gián tiếp thứ tư với Iran. Hai bên đã thảo luận các nội dung liên quan đến cách tiếp tục tuân thủ thỏa thuận hạt nhân trên.</p>\r\n\r\n<p>Trước đó, năm 2018, cựu Tổng thống Mỹ Donald Trump đã rút lui khỏi thỏa thuận này và để cho Iran vi phạm các điều khoản một năm sau đó.</p>\r\n', '2020-08-22 06:09:30'),
(6, 21, 4, 'Tom Cruise trả cúp Quả cầu Vàng và chuyện chưa từng có ở Hollywood', '<p><strong>Giải thưởng của Hiệp hội Báo chí Nước ngoài ở Hollywood (HFPA) đang đối mặt với làn sóng phản đối từ nhiều nghệ sĩ, nhà làm phim và hãng sản xuất.</strong></p>\r\n\r\n<p>Tờ <em>Chicago Sun Times </em>đưa tin hôm 10/5, đại diện NBC cho hay kênh truyền hình sẽ không phát trực tiếp lễ trao giải Quả cầu Vàng 2022. Điều này làm dấy lên băn khoăn về tương lai của giải thưởng điện ảnh có tuổi đời và tỷ lệ người xem đồ sộ nhất nhì lịch sử Hollywood.</p>\r\n\r\n<p>Trong thông báo chính thức, đại diện kênh truyền hình khẳng định đã đến lúc HFPA cần phải cải tổ. Thông báo có đoạn: “Tuy nhiên, việc thay đổi toàn diện không thể diễn ra một sớm một chiều. Chúng tôi tin chắc rằng HFPA cần nhiều thời gian để mọi chuyện đâu vào đấy.</p>\r\n\r\n<p>Cho tới khi ấy, NBC sẽ không phát sóng chương trình lễ trao giải Quả cầu Vàng 2022. Đặt giả thiết hiệp hội sớm kiện toàn tổ chức, chúng tôi hy vọng có thể trở lại và mang đến cho khán giả nội dung lễ trao giải diễn ra vào tháng 1/2023”.</p>\r\n\r\n<h3><strong>Hollywood quay lưng với Quả cầu Vàng</strong></h3>\r\n\r\n<p>Làm sóng chỉ trích HFPA tại Hollywood đã bắt đầu từ tháng 2, sau khi tờ <em>The Los Angeles Times </em>đăng tải bài điều tra nội bộ tổ chức này.</p>\r\n\r\n<p>Kết quả chỉ ra bộ mặt của Hiệp hội Báo chí Nước ngoài ở Hollywood vô cùng nghèo nàn về sắc tộc cũng như giới tính. Không có người da đen nào góp mặt trong hội đồng bỏ phiếu gồm 87 thành viên của HFPA.</p>\r\n', '2021-01-11 15:10:42'),
(8, 22, 6, 'MU bại trận, Man City vô địch Premier League', '<p><strong>Chức vô địch Premier League 2020/21 thuộc về Man City sau khi MU thua Leicester 1-2 ở trận đấu rạng sáng 12/5 (giờ Hà Nội).</strong></p>\r\n\r\n<p>Hai bàn thắng Luke Thomas (phút 10) và Caglar Soyuncu (phút 66) giúp Leicester đánh bại MU. Với kết quả này, \"Quỷ đỏ\" có 70 điểm sau 35 trận, tiếp tục giữ vị trí nhì bảng.</p>\r\n\r\n<p>Cách biệt giữa MU và Man City đang là 10 điểm. Khi mùa giải của 2 đội thành Manchester còn 3 vòng, Man City đã trở thành nhà vô địch Premier League 2020/21.</p>\r\n\r\n<p>Trận thắng trên sân Old Trafford mang ý nghĩa đặc biệt quan trọng cho Leicester. Thầy trò HLV Brendan Rodger đã tiến thêm một bước trong cuộc đua giành suất dự Champions League với Chelsea, Liverpool, West Ham và Tottenham. Lúc này, Leicester có 66 điểm và vươn lên đứng thứ 3.</p>\r\n\r\n<p style=\"text-align:center;\"><img alt=\"\" src=\"http://localhost/codegym/public/upload/1926756284609b2f82c35d0.jpg\" style=\"height:334px;width:500px;\" /></p>\r\n\r\n<p style=\"text-align:center;\"><em>Bàn thắng của Greenwood không thể giúp MU có điểm trước Leicester. Ảnh: Getty.</em></p>\r\n\r\n<p><em>The Guardian</em> nhận định sẽ có rất nhiều tranh cãi sau chiến thắng của Leicester trước MU.</p>\r\n\r\n<p>\"Quỷ đỏ\" đã chắc suất trong top 4, do đó HLV Ole Gunnar Solskjaer thay đổi 10 trên 11 vị trí so với trận trước để giúp trụ cột dưỡng sức. MU ra sân bằng đội hình lại lẫm, bao gồm 2 cái tên lần đầu đá chính ở Premier League là Amad Diallo và Anthony Elanga.</p>\r\n\r\n<p>Donny van de Beek, Juan Mata, Nemanja Matic, Axel Tuanzebe, Brandon Willians, Alex Telles và Eric Bailly có cơ hội hiếm hoi để đá chính ở mùa này. Vì điều đó, MU không thể phát huy sức mạnh trước Leicester sử dụng những cầu thủ tốt nhất.</p>\r\n\r\n<p>Phút thứ 10, Thomas ghi bàn mở tỷ số từ tình huống bắt volley ấn tượng quyết đoán. Nhưng chỉ 5 phút sau, đội chủ nhà gỡ hòa từ pha phối hợp của bộ đôi tuổi teen Mason Greenwood và Amad Diallo. Greenwood đã xử lý táo bạo, rồi dứt điểm hiểm hóc trong khu vực 16,5 m.</p>\r\n\r\n<p>Đó là cú sút duy nhất của MU trong hiệp một đi trúng đích. Trừ Matic và Greenwood, phần còn lại ở đội hình MU đều chơi dở. Những nhân tố trên hàng công, trong lần đầu sát cánh cùng nhau ở Premier League của MU gây thất vọng.</p>\r\n\r\n<p>Sang hiệp 2, thế trận diễn ra chậm rãi. MU cần bóng nhỉnh hơn đôi chút (52%), nhưng các tuyến không liên kết để tổ chức tấn công. Trong khi đó, Leicester quyết tâm lao lên, nhưng lối chơi cũng thiếu biến hóa để khoan thủng bộ tứ vệ chắp vá của MU.</p>\r\n\r\n<p style=\"text-align:center;\"><img alt=\"\" src=\"http://localhost/codegym/public/upload/871881704609b2fbd97056.jpg\" style=\"height:313px;width:500px;\" /></p>\r\n\r\n<p style=\"text-align:center;\"><em>Soyuncu ghi bàn thắng quý giá cho Leicester.</em></p>\r\n\r\n<p>Bàn thắng quyết định cho Leicester đến từ tình huống Soyuncu đánh đầu, sau pha dàn xếp phạt góc. Lần đầu tiên Soyuncu ghi bàn ở Premier League lần này. Đó có thể là bàn thắng quan trọng nhất của Leicester trong mùa này.</p>\r\n\r\n<p>HLV Solskjaer không muốn thất bại. Ông đưa Edinson Cavani, Marcus Rashford vào sân, trước khi MU thủng lưới lần 2. Sau đó, đến lượt Bruno Fernandes xung trận.</p>\r\n\r\n<p>Những cầu thủ chơi tệ bị Ole rút ra. Trong hơn 10 phút cuối, MU tấn công áp đảo, tạo nhiều áp lực về khu vực 16,5 m của Leicester. Tuy nhiên, bàn thắng không đến.</p>\r\n\r\n<p>Toàn đội Leicester đã vỡ òa khi hạ MU 2-1. Chiến thắng của Leicester cũng là niềm vui cho Man City, trong khi MU không gặp bất lợi nào vì số phận của họ ở mùa này đã an bài.</p>\r\n\r\n<p>Trên BXH, Leicester hơn đội xếp thứ 5 là West Ham 8 điểm, chơi nhiều hơn một trận. \"Bầy cáo\" tạo cách biệt 10 điểm với Liverpool, chơi nhiều hơn đối thủ 2 trận.</p>\r\n\r\n<p>Thế khó trong cuộc đua giành vé dự Champions League đang dồn về phía Liverpool. Ngày 14/5, Liverpool phải đối đầu MU ở Old Trafford. Trong trường hợp Liverpool thua, họ sẽ hết cửa vào top 4.</p>\r\n', '2021-02-18 15:24:05'),
(11, 21, 5, 'Tesla có thể chấp nhận thanh toán bằng Dogecoin', '<p>Tỷ phú Elon Musk đăng một khảo sát trên Twitter, trong đó hỏi rằng \"Bạn có muốn Tesla chấp nhận Doge không?\".</p>\r\n\r\n<p>Khảo sát nhận được sự quan tâm của lượng lớn người dùng với hơn 3,7 triệu người tham gia. 78% trong số đó đồng ý rằng Tesla nên chấp nhận tiền số Dogecoin (Doge), trong khi 22% còn lại thì không. Dưới phần bình luận, nhiều người ủng hộ ý tưởng Tesla nên dùng Dogecoin làm phương tiện thanh toán.</p>\r\n\r\n<p style=\"text-align:center;\"><img alt=\"\" src=\"http://localhost/codegym/public/upload/835107726609b8b9ce1567.png\" style=\"height:243px;width:700px;\" /></p>\r\n\r\n<p style=\"text-align:center;\"><em>Khảo sát của Elon Musk về việc Tesla chấp nhận thanh toán bằng Bitcoin nhận sự chú ý lớn.</em></p>\r\n\r\n<p>Trước đó, Tesla cũng đã chấp nhận Bitcoin là đồng tiền số có thể dùng để mua xe điện của hãng. Hồi đầu năm, công ty cũng đã chi hơn 1,5 tỷ USD để mua tiền số này.</p>\r\n\r\n<p>Elon Musk đã tổ chức cuộc thăm dò về Dogecoin trên Twitter sau khi rời chương trình Saturday Night Live (SNL) phát sóng ngày 9/5. Tại show truyền hình này, CEO Tesla và SpaceX cho rằng Dogecoin là \"tương lai của tiền tệ\" và là \"phương tiện tài chính sẽ chiếm lĩnh thế giới\". Dù vậy, khi được hỏi Dogecoin có phải là một trò đùa, tỷ phú này đáp: \"Đúng, nó là một trò đùa\".</p>\r\n\r\n<p>Những câu trả lời của Elon Musk tại SNL được cho là nguyên nhân trực tiếp khiến giá Dogecoin sụt giảm. Theo Coinmarketcap, đồng tiền mã hoá lớn thứ 4 thế giới đã giảm gần 40% trong 24 giờ sau đó, thổi bay vốn hoá hơn 20 tỷ USD. Hiện tại, mỗi Dogecoin có giá khoảng 0,49 USD.</p>\r\n\r\n<p>Theo tính toán, dựa trên giá trị hiện tại, mỗi người sẽ cần 80.000 Doge, hoặc 0,7 Bitcoin để trả cho một chiếc xe Model 3 - mẫu xe rẻ nhất của Tesla hiện tại.</p>\r\n\r\n<p>Elon Musk nhiều lần công khai ủng hộ Dogecoin trên Twitter. Ông cũng tự gọi mình là \"Dogefather\" và khiến giá đồng tiền này tăng 100% chỉ sau một tweet.</p>\r\n\r\n<p>Trước Tesla, Elon Musk cũng cho biết SpaceX sẽ thực hiện \"Sứ mệnh Doge lên Mặt trăng\" vào năm tới. Công ty sẽ phóng vệ tinh Doge-1 lên quỹ đạo, dùng tiền điện tử Dogecoin để thanh toán.</p>\r\n\r\n<p>Dogecoin là tiền điện tử được tạo ra vào năm 2013, có biểu tượng hình chó Shiba. Ban đầu, nó được xem là trò đùa, nhưng đã tăng tăng 800% trong tháng qua và 2.000% kể từ đầu năm nhờ sự ủng hộ của một loạt tên tuổi lớn, gồm Elon Musk, tỷ phú Mark Cuban và rapper Snoop Dogg.</p>\r\n', '2020-05-11 10:05:31'),
(12, 21, 2, 'testddsadas', '<p><img alt=\"\" src=\"http://localhost/codegym/public/upload/661229126609e331885ebb.png\" style=\"height:79px;width:750px;\" />dasdasdasdsadas</p>\n', '2022-05-22 15:03:21'),
(21, 21, 3, '&#39;Tháng thảm họa của Bitcoin&#39;', '<p>Các thông tin tiêu cực liên tục đè nặng lên Bitcoin trong tháng 5. Chuyên gia quốc tế nhận định đây là thời điểm nhạy cảm của thị trường do giới đầu tư chưa chắc chắn về mức đáy.</p>\n\n<p>Theo dữ liệu của <em>Coin Desk </em>hôm 29/5 (giờ Việt Nam), giá Bitcoin có thời điểm mất mốc 35.000 USD/đồng, rơi xuống mức 34.741 USD/đồng. Giá sau đó trở lại hơn 36.000 USD/đồng, giảm 5,08% so với một ngày trước đó.</p>\n\n<p>Giá trị vốn hóa thị trường của Bitcoin bị thu hẹp còn 680 tỷ USD. Mức tăng tính từ hồi đầu năm 2021 giảm còn 24,72%.</p>\n\n<p>Ngoài Bitcoin, giá của các loại tiền mã hóa khác cũng đồng loạt lao dốc. Giá Ether - đồng tiền mã hóa lớn thứ hai thế giới - giảm 7,9% so với một ngày trước đó xuống hơn 2.500 USD/đồng. Dogecoin cũng chứng kiến mức sụt giá 5,48%. Đồng tiền đã tăng giá phi mã hơn 6.500% kể từ đầu năm.</p>\n\n<p>Trao đổi với <em>Zing</em>, chuyên gia tài chính Edward Moya tại hãng tư vấn Oanda (Mỹ) bình luận nhận định các nhà đầu tư vẫn chưa biết giá Bitcoin có thể giảm đến mức nào. Do đó, bất cứ thông tin tiêu cực nào cũng có khả năng kéo tụt giá của tiền mã hóa.</p>\n\n<p style=\"text-align:center;\"><img alt=\"\" src=\"http://localhost/codegym/public/upload/134571030160b1f42b24c97.jpeg\" style=\"height:333px;width:500px;\" /></p>\n', '2021-05-29 14:58:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL DEFAULT 2,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `usertype_id`, `username`, `email`, `password`) VALUES
(21, 1, 'taikhoan1', 'taikhoan1@gmail.com', '$2y$10$bJLnae4GPIJmlx.rEI0tDeoExOICYZPkCIqpqF/W2L.WDdQbkLnH6'),
(22, 2, 'taikhoan2', 'taikhoan2@gmail.com', '$2y$10$jidBxlA8eFDjbE4qkOqYx.rrj5u6U8w3.kcTYw4WF0slAS4./FF7u'),
(23, 2, 'taikhoan3', 'taikhoan3@gmail.com', '$2y$10$fUJOYjeGD4rRe0cyU2sU.uUEzp.EK3yoVRaa4zKNdfwxMjINtSJN6'),
(24, 2, 'taikhoan4', 'taikhoan4@gmail.com', '$2y$10$Duuyowhj2QfUXMJC8SObRu6.uyF7uTVUJvhpdC/Q85.DkkuhkBUqa'),
(25, 2, 'taikhoan5', 'taikhoan5@gmail.com', '$2y$10$9PocH/PBow39c/hGK.cTjuEfVcaHkSZfZt6XOPaTrJeXmJP6FeoO2'),
(26, 2, 'taikhoan9', 'anhvu.pa96@gmail.com', '$2y$10$sIh7KVvcjjm8JIaGXmgMxO0oGgHVSZyTF/PMGPHaobO94D8uAmqJe');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_pk` (`user_id`),
  ADD KEY `category_id_pk` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `usertype_fgk` (`usertype_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `category_id_pk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `user_id_pk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `usertype_fgk` FOREIGN KEY (`usertype_id`) REFERENCES `user_types` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
