import { Form } from "react-bootstrap";
import React, { useEffect, useState } from 'react'
import { useNavigate } from "react-router-dom";
import "./Main.css";
import { Category, PostShow } from "../../../model";
import { currencyMaskString } from "../../../mask";
import { getPost } from "../../../redux/apiRequest";
import { useDispatch } from "react-redux";
import _ from 'lodash';

const Main = () => {
    const [posts, setPosts] = useState<PostShow[]>([]);
    const navigate = useNavigate();
    const dispatch = useDispatch();
    const [filter, setFilter] = useState<string>("0");
    const category: Category = {
        id: "",
        name: "All Categories",
        icon: "https://pic.onlinewebfonts.com/svg/img_123607.png"
    };
    useEffect(() => {
        switch (filter) {
            case "1":
                fetchData();
                setPosts(_.orderBy(posts, ['title', 'price'], ['asc', 'desc']));
                break;
            case "2":
                fetchData();
                setPosts(_.orderBy(posts, ['title', 'price'], ['desc', 'asc']));
                break;
            default:
                fetchData();
                break;
        }
    }, []);
    const redirectProduct = (post: PostShow) => {
        getPost(post, dispatch, navigate);
    }
    async function fetchData() {
        const response = await fetch("http://nguyenxuanthuan-001-site1.htempurl.com/api/posts");
        const data = await response.json();
        setPosts(data.data);
        console.log(posts);
    }
    return (
        <div id="Main" className="right-side">
            <div className="nav-title">
                <h3>{category.name}</h3>
                <Form.Select aria-label="Default select example" className="filter">
                    <option value="0">Default</option>
                    <option value="1">Lowest first</option>
                    <option value="2">Highest first</option>
                </Form.Select>
            </div>
            <ul className="products">
                {
                    posts?.map((item, index) => {
                        return (
                            <li key={index} className="item clearfix" onClick={() => { redirectProduct(item) }}>
                                <div className="item-img">
                                    <img src={item.imageUrl} alt="" />
                                </div>
                                <div className="item-cover">
                                    <h2 className="item-title">{item.title}</h2>
                                    <h2 className="item-name">{item.product.name}</h2>
                                    <span className="item-price">{`${currencyMaskString(item.price)} đ`}</span>
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

export default Main;