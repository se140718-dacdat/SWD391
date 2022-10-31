import { Form } from "react-bootstrap";
import React, { Dispatch, SetStateAction, useEffect, useState } from 'react'
import { useDispatch, useSelector } from "react-redux";
import { useNavigate, useParams } from "react-router-dom";
import "./Main.css";
import { Category, PostShow } from "../../../model";
import { getCategoryById } from "../../../redux/apiRequest";

const Filter = () => {
    const params = useParams();
    const [posts, setPosts] = useState<PostShow[]>([]);
    const navigate = useNavigate();
    const [category, setCategory] = useState<Category>({
        id: "",
        name: "All Categories",
        icon: "https://pic.onlinewebfonts.com/svg/img_123607.png"
    });
    useEffect(() => {
        fetchData();
    }, []);

    async function fetchData() {
        const response = await fetch(`https://localhost:5001/api/posts/catecories?id=${params.id}`);
        const data = await response.json();
        setPosts(data.data);
        const res = await fetch(`https://localhost:5001/api/categories/${params.id}`);
        const dataRes = await res.json();
        setCategory(dataRes.data);
    }
    return (
        <div id="Main" className="right-side">
            <div className="nav-title">
                <h3>{category?.name}</h3>
                <Form.Select aria-label="Default select example" className="filter">
                    <option>Mặc định</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </Form.Select>
            </div>
            <ul className="products">
                {
                    posts?.map((item, index) => {
                        return (
                            <li key={index} className="item clearfix" onClick={() => { navigate('/product') }}>
                                <div className="item-img">
                                    <img src={item.imageUrl} alt="" />
                                </div>
                                <div className="item-cover">
                                    <h2 className="item-title">{item.title}</h2>
                                    <h2 className="item-name">{item.product.name}</h2>
                                    <span className="item-price">{`${item.price} đ`}</span>
                                    <span className="item-store">{`${item.building.name}-${item.building.address}`}</span>
                                </div>
                            </li>
                        );
                    })
                }
            </ul>
        </div>
    );
}

export default Filter;