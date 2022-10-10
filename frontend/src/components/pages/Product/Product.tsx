import "./Product.css";

const Product: React.FC = props => {
    return (
        <div id="Product" className="right-side">
            <div className="nav">
                <a className="link">Trang chủ</a>&nbsp;/&nbsp;<a className="link">Xem tất cả</a>
            </div>
            <div className="border">
                <div className="product-type">
                    <div className="product-img">
                        <img src="https://demos.buddyboss.com/online-communities/wp-content/sandbox64720-uploads/2019/05/swim-trunk.png" alt="" />
                    </div>
                    <div className="product-summary">
                        <h1 className="product-name">classic swim trunk</h1>
                        <div className="product-price">$150.00</div>
                        <div className="product-description">Swimmer Red 4 Way Stretch 13”</div>
                        <button className="btn-addtocart">add to cart</button>
                        <h4>SPECS</h4>
                        <div className="product-information">
                            <span className="dimensions-wrapper">
                                <span className="product-att-title">Dimensions:</span>
                                <span className="product-att">16 × 9 × 13 in</span>
                            </span>
                            <span className="sku-wrapper">
                                <span className="product-att-title">SKU:</span>
                                <span className="product-att">HDGHR275JGD</span>
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
        </div>
    )
}

export default Product;