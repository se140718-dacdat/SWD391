import { Form, Pagination } from "react-bootstrap";
import React, { useEffect, useState } from 'react'
import { useNavigate } from "react-router-dom";
import "./Main.css";
import "./Store.css";
import { PostShow } from "../../../model";
import { currencyMaskString } from "../../../mask";
import { getPost } from "../../../redux/apiRequest";
import { useDispatch, useSelector } from "react-redux";
import _ from "lodash";


const Store = () => {
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const [posts, setPosts] = useState<PostShow[]>([]);
    const [allPosts, setAllPosts] = useState<PostShow[]>([]);
    const [filter, setFilter] = useState<string>();
    const [page, setPage] = useState<number>(1);
    const navigate = useNavigate();
    const dispatch = useDispatch();
    useEffect(() => {
        fetchData();
    }, [page, filter]);
    const redirectProduct = (post: PostShow) => {
        getPost(post, dispatch, navigate);
    }
    async function fetchData() {
        try {
            const res = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/posts/accounts?id=${user?.id}&page=${page}&pageSize=5`, {
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                },
            });
            const resData = await res.json();
            handleFilter(resData.data);
            const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/posts/accounts?id=${user?.id}`, {
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                },
            });
            const data = await response.json();
            setAllPosts(data.data);
        } catch (error) {
            return error;
        }
    }
    const handleFilter = (posts: PostShow[]) => {
        switch (filter) {
            case "1":
                setPosts(_.orderBy(posts, ['price'], ['asc', 'desc']));
                break;
            case "2":
                setPosts(_.orderBy(posts, ['price'], ['desc', 'asc']));
                break;
            default:
                setPosts(posts);
                break;
        }
    }
    async function removePost(id: string) {
        try {
            const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/posts/${id}`, {
                method: 'DELETE',
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                },
            });
        } catch (error) {
            console.log(error);
        }
    }

    const Paging = (lenght: number) => {
        let items: any = [];
        for (let number = 1; number <= lenght % 5; number++) {
            items.push(
                <Pagination.Item onClick={() => { setPage(number) }} key={number} active={number === page}>
                    {number}
                </Pagination.Item>
            );
        }
        return (
            <div className="page">
                <Pagination>{items}</Pagination>
                <br />
            </div>
        )
    }
    return (
        <div id="Main" className="right-side">
            <div className="nav-title">
                <h3>Manage Posts</h3>
                <Form.Select aria-label="Default select example" className="filter" onChange={(e)=> {setFilter(e.target.value)}}>
                    <option>Default</option>
                    <option value="1">Lowest</option>
                    <option value="2">Highest</option>
                </Form.Select>
            </div>
            <div className="user-info">
                <img src={user.avatarUrl} alt="user-avt" className='user-info-avt' />
                <div className="user-wrap">
                    <span className='user-info-name'>{user?.fullName}</span>
                    <span className='user-info-email'>{user?.description}</span>
                    <div className="inline-block">
                        <button className="btn-primary-oposite" onClick={() => {navigate("/profile")}}>See all profiles</button>
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
                                </div>
                                <div className="product-remove">
                                    <div className="btn-remove" onClick={() => { removePost(item.id) }}>×</div>
                                </div>
                            </li>
                        );
                    })
                }
            </ul>
            {Paging(Math.ceil(allPosts.length / 5))}

        </div>
    );
}

export default Store;