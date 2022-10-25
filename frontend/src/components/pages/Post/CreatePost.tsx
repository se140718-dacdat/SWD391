import "./CreatePost.css";
import React, { FormEvent, useState } from 'react';
import { Form } from "react-bootstrap";
import { Post } from "../../../model";

const CreatePost: React.FC = props => {
    const [preview, isPreview] = useState<String>("Preview");
    const [post, setPost] = useState<Post>();
    const [select, setSelect] = useState<String>("");
    const handleChange = (e: FormEvent) => {
        setSelect(e.target.value);
    }
    const renderSwitch = () => {
        switch (preview) {
            case "Preview":
                return (
                    <div className="post-wrap">
                        <div className="post-img">
                            <div className="input-img" onClick={() => {
                                document.getElementById("img-file")?.click();
                            }}>
                                <input type="file" accept="" id="img-file" style={{ display: "none" }} />
                                <div className="s6ete4"><svg xmlns="http://www.w3.org/2000/svg" width="53" height="39" viewBox="0 0 53 39">
                                    <g fill="none" fill-rule="evenodd" stroke="none" stroke-width="1"><g stroke="#FE9900" stroke-width="2" transform="translate(-255 -179)"><g transform="translate(132 122)"><path d="M150.631 87.337c-5.755 0-10.42-4.534-10.42-10.127 0-5.593 4.665-10.127 10.42-10.127s10.42 4.534 10.42 10.127c0 5.593-4.665 10.127-10.42 10.127m10.42-24.755l-2.315-4.501h-16.21l-2.316 4.5h-11.579s-4.631 0-4.631 4.502v22.505c0 4.5 4.631 4.5 4.631 4.5h41.684s4.631 0 4.631-4.5V67.083c0-4.501-4.631-4.501-4.631-4.501h-9.263z"></path></g></g></g></svg><span className="ffyigpx"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 20 21"><g fill="none" fill-rule="evenodd" stroke="none" stroke-width="1"><g fill="#FE9900" transform="translate(-161 -428)"><g transform="translate(132 398)"><g transform="translate(16.648 17.048)"><g transform="rotate(-180 16.142 16.838)"><rect width="2.643" height="19.82" x="8.588" y="0" rx="1.321"></rect><path d="M9.91 0c.73 0 1.321.592 1.321 1.321v17.177a1.321 1.321 0 01-2.643 0V1.321C8.588.591 9.18 0 9.91 0z" transform="rotate(90 9.91 9.91)"></path></g></g></g></g></g></svg></span>
                                </div>
                            </div>
                        </div>
                        <div className="post-data">
                            <h1>Post details</h1>
                            <div className="input inline-block">
                                <div className="input-title">Post name</div>
                                <Form.Select className="input-value" style={{ display: "inline-block" }}>
                                    <option>Select Category</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </Form.Select>
                            </div>
                            <div className="input inline-block">
                                <div className="input-title">Post name</div>
                                <input type="text" className="input-value" />
                            </div>
                            <div className="input inline-block">
                                <div className="input-title">Regular price ($)</div>
                                <input type="text" className="input-value" />
                            </div>
                            <div className="input inline-block">
                                <div className="input-title">Dimensions</div>
                                <input type="text" className="input-value" />
                            </div>
                            <div className="input inline-block">
                                <div className="input-title">Stock quantity</div>
                                <input type="text" className="input-value" />
                            </div>
                            <div className="btn-wrap">
                                <button className="btn-preview-edit" onClick={() => { (preview) == "Preview" ? isPreview("Edit post") : isPreview("Preview") }}>{preview}</button>
                                <button className="btn-upload">Upload</button>
                            </div>
                        </div>
                    </div>
                )
            case "Edit post":
                return (
                    <div>
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
                        <div className="btn-wrap">
                            <button className="btn-preview-edit" onClick={() => { (preview) == "Preview" ? isPreview("Edit post") : isPreview("Preview") }}>{preview}</button>
                            <button className="btn-upload">Upload</button>
                        </div>

                    </div>
                )
        }
    }
    return (
        <div id="CreatePost" className="right-side clear-fix">
            <h1 style={{ fontSize: "32px" }} >Create your post</h1>
            {renderSwitch()}
        </div>
    );
}
export default CreatePost;