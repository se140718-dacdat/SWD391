import { Form, Pagination } from "react-bootstrap";
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
    const [filter, setFilter] = useState<string>();
    const [allPosts, setAllPosts] = useState<PostShow[]>([]);
    const [page, setPage] = useState<number>(1);
    const category: Category = {
        id: "",
        name: "All Categories",
        icon: "https://pic.onlinewebfonts.com/svg/img_123607.png"
    };
    useEffect(() => {
        handleFilter();
    }, [page]);
    const redirectProduct = (post: PostShow) => {
        getPost(post, dispatch, navigate);
    }
    async function fetchData() {
        const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/posts?page=${page}&pageSize=5`);
        const data = await response.json();
        setPosts(data.data);
        const res = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/posts`);
        const resData = await res.json();
        setAllPosts(resData.data);
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

    const handleFilter = () => {
        switch (filter) {
            case "1":
                fetchData();
                setPosts(_.orderBy(posts, ['title', 'price'], ['asc', 'desc']));
                console.log(posts);
                break;
            case "2":
                fetchData();
                setPosts(_.orderBy(posts, ['title', 'price'], ['desc', 'asc']));
                console.log(posts);
                break;
            default:
                fetchData();
                console.log(posts);
                break;
        }
    }
    return (
        <div id="Main" className="right-side">
            <div className="nav-title">
                <h3>{category.name}</h3>
                <Form.Select aria-label="Default select example" className="filter" onChange={(e) => {setFilter(e.target.value)}}>
                    <option>Default</option>
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
            {Paging(Math.ceil(allPosts.length / 5))}
        </div>
    );
}

export default Main;