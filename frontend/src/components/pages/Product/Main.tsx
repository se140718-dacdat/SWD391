import { Form } from "react-bootstrap";
import { useNavigate } from "react-router-dom";
import "./Main.css";
import Product from "./Product";

const Main: React.FC = props => {
    const navigate = useNavigate();
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
                <li className="item clearfix" onClick={()=> {navigate('/product')}}>
                    <div className="item-img">
                        <img src="/images/ip14.png" alt="" />
                    </div>
                    <div className="item-cover">
                        <h2 className="item-title">iPhone 14 Pro 256GB | Chính hãng VN/A</h2>
                        <span className="item-price">32.990.000 ₫</span>
                        <div className="space"></div>
                        <span className="item-store">Dat LU Store</span>
                    </div>
                </li>
                <li className="item clearfix" onClick={()=> {return <Product/>}}>
                    <div className="item-img">
                        <img src="/images/ip14.png" alt="" />
                    </div>
                    <div className="item-cover">
                        <h2 className="item-title">iPhone 14 Pro 256GB | Chính hãng VN/A</h2>
                        <span className="item-price">32.990.000 ₫</span>
                        <div className="space"></div>
                        <span className="item-store">Dat LU Store</span>
                    </div>
                </li>
                <li className="item clearfix" onClick={()=> {return <Product/>}}>
                    <div className="item-img">
                        <img src="/images/ip14.png" alt="" />
                    </div>
                    <div className="item-cover">
                        <h2 className="item-title">iPhone 14 Pro 256GB | Chính hãng VN/A</h2>
                        <span className="item-price">32.990.000 ₫</span>
                        <div className="space"></div>
                        <span className="item-store">Dat LU Store</span>
                    </div>
                </li>
                <li className="item clearfix" onClick={()=> {return <Product/>}}>
                    <div className="item-img">
                        <img src="/images/ip14.png" alt="" />
                    </div>
                    <div className="item-cover">
                        <h2 className="item-title">iPhone 14 Pro 256GB | Chính hãng VN/A</h2>
                        <span className="item-price">32.990.000 ₫</span>
                        <div className="space"></div>
                        <span className="item-store">Dat LU Store</span>
                    </div>
                </li>
            </ul>
        </div>
    );
}

export default Main;