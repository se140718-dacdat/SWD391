import "./Product.css";

const Product: React.FC = props => {
    return (
        <div id="Product" className="right-side">
            <div className="border">
                <div className="product-type">
                    <div className="product-img">
                        <img src="/images/ip14.png" alt="" />
                    </div>
                    <div className="product-summary">
                        <h1 className="product-name">iPhone 14 Pro 256GB | Chính hãng VN/A</h1>
                        <div className="product-price">32.990.000 ₫</div>
                        <button className="btn-addtocart">add to cart</button>
                        <h4>SPECS</h4>
                        <div className="product-information">
                            <span className="dimensions-wrapper">
                                <span className="product-att-title">Dimensions:</span>
                                <span className="product-att">16 × 9 × 13 in</span>
                            </span>
                            <span className="category-wrapper">
                                <span className="product-att-title">Category:</span>
                                <span className="product-att">Uncategoried</span>
                            </span>
                            <span className="tag-wrapper">
                                <span className="product-att-title">Tag:</span>
                                <span className="product-att">Swimming wear</span>
                            </span>
                            <span className="availability-wrapper">
                                <span className="product-att-title">Availability:</span>
                                <span className="product-att">120 in stock</span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div className="border">
                <div className="p-32">
                    <h3>Description</h3>
                    <div className="description">ĐẶC ĐIỂM NỔI BẬT
                        Trải nghiệm thị giác ấn tượng - Màn hình Dynamic Island, sắc nét với công nghệ Super Retina XDR, mượt mà 120 Hz
                        Tuyệt đỉnh thiết kế, tỉ mỉ từng đường nét - Nâng cấp toàn diện với kiểu dáng mới, nhiều lựa chọn màu sắc trẻ trung
                        Hiệu năng hàng đầu thế giới - Apple A16 Bionic xử lí nhanh, ổn định mọi tác vụ
                        Camera chuẩn nhiếp ảnh chuyên nghiệp - Camera sau 48MP trang bị nhiều công nghệ chụp đa dạng
                        iPhone 14 Pro có sự cải thiện lớn màn hình so với iPhone 13 Pro. Sự khác biệt giữ phiên bản iPhone 14 Pro 256GB và 128GB tiêu chuẩn chỉ là bộ nhớ trong. Dưới đây là một số cải tiến nổi bật trên iPhone 14 Pro mà có thể bạn chưa biết!

                        Mời bạn tìm hiểu thêm về phiên bản iPhone 14 Pro 128GB với nhiều chương trình khuyến mãi tại CellPhoneS!

                        Kích thước màn hình iPhone 14 Pro vẫn là 6.1 inch tuy nhiên phần “tai thỏ” đã được thay thế bằng một đường cắt hình viên thuốc. Apple gọi đây là Dynamic Island - nơi chứa camera Face ID và một đường cắt hình tròn thứ hai cho camera trước.

                        Ngoài ra, iPhone 14 Pro có tính năng màn hình luôn bật hoạt động (Always-on Display) với tiện ích màn hình khóa mới trên iOS 16. Người dùng có thể xem các thông tin như lời nhắc, sự kiện lịch và thời tiết mà không cần bật máy lên để xem. Thậm chí, có một trạng thái ngủ cho hình nền, trạng thái này sẽ làm tối hình nền để sử dụng ít pin hơn.

                        iPhone 14 Pro được trang bị bộ vi xử lý Apple A16 Bionic. Apple đã tập trung vào hiệu quả sử dụng năng lượng, màn hình và camera với con chip mới của mình. CPU sáu nhân bao gồm hai nhân hiệu suất cao sử dụng năng lượng thấp hơn 20% và bốn nhân tiết kiệm pin chỉ sử dụng một phần ba năng lượng so với chip của các đối thủ cạnh tranh.</div>
                </div>
            </div>
        </div>
    )
}

export default Product;