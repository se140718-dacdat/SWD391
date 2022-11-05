import { Form } from "react-bootstrap";
import React, { useEffect, useState } from 'react'
import { useNavigate } from "react-router-dom";
import "./Main.css";
import "./Store.css";
import { Category, PostShow } from "../../../model";
import { currencyMaskString } from "../../../mask";
import { getPost } from "../../../redux/apiRequest";
import { useDispatch, useSelector } from "react-redux";
import axios from "axios";

const Store = () => {
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const [posts, setPosts] = useState<PostShow[]>([]);
    const navigate = useNavigate();
    const dispatch = useDispatch();
    useEffect(() => {
        fetchData();
    }, []);
    const redirectProduct = (post: PostShow) => {
        getPost(post, dispatch, navigate);
    }
    async function fetchData() {
        try {
            const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/posts/accounts?id=${user?.id}`, {
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                },
            });
            const data = await response.json();
            setPosts(data.data);
            console.log(`posts: ${posts}`);
        } catch (error) {
            return error;
        }
    }
    async function removePost (id: string) {
        try {
            const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/posts/${id}`, {
                method: 'DELETE',
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                },
            });
            console.log(`posts: ${id}`);
        } catch (error) {
            console.log(error);
        }
    }
    return (
        <div id="Main" className="right-side">
            <div className="nav-title">
                <h3>Manage Posts</h3>
                <Form.Select aria-label="Default select example" className="filter">
                    <option>Mặc định</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </Form.Select>
            </div>
            <div className="user-info">
                <img src={user.avatarUrl} alt="user-avt" className='user-info-avt' />
                <div className="user-wrap">
                    <span className='user-info-name'>{user?.fullName}</span>
                    <span className='user-info-email'>{user?.description}</span>
                    <div className="inline-block">
                        <button className="btn-primary-oposite">See all profiles</button>
                        <button className="btn-primary-oposite">E-wallet</button>
                    </div>
                </div>
            </div>
            <ul className="products">
                {
                    posts?.map((item, index) => {
                        return (
                            <li key={index} className="item clearfix" 
                            // onClick={() => { redirectProduct(item) }}
                            >
                                <div className="item-img">
                                    <img src={item.imageUrl} alt="" />
                                </div>
                                <div className="item-cover">
                                    <h2 className="item-title">{item.title}</h2>
                                    <h2 className="item-name">{item.product.name}</h2>
                                    <span className="item-price">{`${currencyMaskString(item.price)} đ`}</span>
                                    <span className="item-store">{`${item.building?.name}-${item.building?.address}`}</span>
                                    <button className="product-remove" onClick={()=>{removePost(item.id)}}><div className="btn-remove">×</div></button>
                                </div>
                            </li>
                        );
                    })
                }
            </ul>
        </div>
    );
}

export default Store;