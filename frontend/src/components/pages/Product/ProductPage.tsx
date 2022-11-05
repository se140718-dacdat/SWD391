import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { currencyMaskString } from "../../../mask";
import { cartItem, Category, PostShow, Product } from "../../../model";
import { addQuantity, addToCart } from "../../../redux/apiRequest";
import "./ProductPage.css";


const ProductPage: React.FC = props => {
    const dispatch = useDispatch();
    const post = useSelector((state: any) => state.post.post.currentPost);
    const cart = useSelector((state: any) => state.cart.cart.currentCart);
    const [product, setProduct] = useState<Product>();
    const [category, setCategory] = useState<Category>();
    useEffect(() => {
        fetchData();
    }, []);

    async function fetchData() {
        const res = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/categories/${post?.product.categoryId}`);
        const data = await res.json();
        setCategory(data.data);
        setProduct(post?.product);
    }

    const cartHandle = (params: PostShow) => {
        let list: cartItem[] = [...cart]; 
        let i = list.findIndex(e => e.post.id === params.id);
        if(i > -1) {
            let editItem: cartItem = {
                post: list[i].post,
                quantity: list[i].quantity+1
            }
            list[i] = editItem
            addQuantity(list, dispatch);
        }
        else {
            addToCart(params, dispatch);
        }
    }

    return (
        <div id="ProductPage" className="right-side">
            <div className="border">
                <div className="product-type">
                    <div className="product-img">
                        <img src={post?.imageUrl} alt="" />
                    </div>
                    <div className="product-summary">
                        <h1 className="product-name">{post?.title}</h1>
                        <div className="product-price">{`${currencyMaskString(post?.price)} ₫`}</div>
                        <button className="btn-addtocart" onClick={() => { cartHandle(post) }}>add to cart</button>
                        <h4>SPECS</h4>
                        <div className="product-information">
                            <span className="category-wrapper">
                                <span className="product-att-title">Category:</span>
                                <span className="product-att">{category?.name}</span>
                            </span>
                            <span className="availability-wrapper">
                                <span className="product-att-title">Availability:</span>
                                <span className="product-att">{`${product?.quantity} in stock`}</span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div className="border">
                <div className="p-32">
                    <h3>Description</h3>
                    <div className="description">{post?.description}</div>
                </div>
            </div>
            <div className="border">
                <div className="p-32">
                    <h3>ProductPage Details</h3>
                    <div className="description">{product?.description}</div>
                </div>
            </div>
        </div>
    )
}

export default ProductPage;