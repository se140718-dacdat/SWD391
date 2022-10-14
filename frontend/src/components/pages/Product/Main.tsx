import { Form } from "react-bootstrap";
import "./Main.css";

const Main: React.FC = props => {
    return (
        <div id="Main" className="right-side">
            <div className="nav">
                <a className="link">Trang chủ</a>&nbsp;/&nbsp;<a className="link">Xem tất cả</a>
            </div>
            <div className="nav-title">
                <h3>Lướt xem tất cả</h3>
                <Form.Select aria-label="Default select example" className="filter">
                    <option>Mặc định</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </Form.Select>
            </div>
            <ul className="products">
                <li className="item clearfix">
                    <div className="item-img">
                        <img src="https://demos.buddyboss.com/online-communities/wp-content/sandbox64720-uploads/2019/05/swim-trunk.png" alt="" />
                    </div>
                    <div className="item-cover">
                        <h2 className="item-title">Classic swim trunk</h2>
                        <span className="item-price">$150.0</span>
                        <div className="space"></div>
                        <span className="item-store">Dat LU Store</span>
                    </div>
                </li>
                <li className="item clearfix">
                    <div className="item-img">
                        <img src="https://demos.buddyboss.com/online-communities/wp-content/sandbox64720-uploads/2019/05/swim-trunk.png" alt="" />
                    </div>
                    <div className="item-cover">
                        <h2 className="item-title">Classic swim trunk</h2>
                        <span className="item-price">$150.0</span>
                        <div className="space"></div>
                        <span className="item-store">Dat LU Store</span>
                    </div>
                </li>
                <li className="item clearfix">
                    <div className="item-img">
                        <img src="https://demos.buddyboss.com/online-communities/wp-content/sandbox64720-uploads/2019/05/swim-trunk.png" alt="" />
                    </div>
                    <div className="item-cover">
                        <h2 className="item-title">Classic swim trunk</h2>
                        <span className="item-price">$150.0</span>
                        <div className="space"></div>
                        <span className="item-store">Dat LU Store</span>
                    </div>
                </li>
                <li className="item clearfix">
                    <div className="item-img">
                        <img src="https://demos.buddyboss.com/online-communities/wp-content/sandbox64720-uploads/2019/05/swim-trunk.png" alt="" />
                    </div>
                    <div className="item-cover">
                        <h2 className="item-title">Classic swim trunk</h2>
                        <span className="item-price">$150.0</span>
                        <div className="space"></div>
                        <span className="item-store">Dat LU Store</span>
                    </div>
                </li>
            </ul>
        </div>
    );
}

export default Main;