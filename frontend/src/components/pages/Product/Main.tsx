import { Form, Pagination } from "react-bootstrap";
import React, { FC, useEffect, useState } from 'react'
import { useNavigate, useParams } from "react-router-dom";
import "./Main.css";
import { Category, PostShow } from "../../../model";
import { currencyMaskString } from "../../../mask";
import { getPost, getUser } from "../../../redux/apiRequest";
import { useDispatch, useSelector } from "react-redux";
import _ from 'lodash';
import Page from "../../modules/pagecomponents/Page/Page";


const Main = () => {
    const params = useParams();
    const [posts, setPosts] = useState<PostShow[]>([]);
    const navigate = useNavigate();
    const dispatch = useDispatch();
    const [filter, setFilter] = useState<string>();
    const [length, setLength] = useState(1);
    const [keyword, setKeyword] = useState('');
    const [sortBy, setSortBy] = useState('');
    const [order, setOrder] = useState('');
    const [page, setPage] = useState<number>(1);
    const [categoryId, setCategoryId] = useState<string>('');

    const category: Category = {
        id: "",
        name: "All Categories",
        icon: "https://pic.onlinewebfonts.com/svg/img_123607.png"
    };

    useEffect(() => {
        fetchData();
    }, [ page, filter, keyword, params.id, categoryId]);

    const redirectProduct = (post: PostShow) => {
        getPost(post, dispatch, navigate);
    }

    async function fetchData() {
        if(params.id) {
            setCategoryId(params?.id);
        } else {
            setCategoryId('');
        }
        const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/search?${keyword}page=${page}&pageSize=5${categoryId}`);
        const data = await response.json();
        handleFilter(data.data.post);
        const getLength = categoryId.replace('&', "?");
        const res = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/search${getLength}`);
        const resData = await res.json();
        setLength(resData.data.total);
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

    return (
        <div id="Main" className="right-side">
            <div className="nav-title">
                <div className="search">
                    <i className="pi pi-search"></i>
                    <input type="search" className="search-bar" placeholder='Search...' onChange={(e) => { setKeyword(`Keyword=${e.target.value}&`) }} />
                </div>
                <Form.Select aria-label="Default select example" className="filter" onChange={(e) => { setFilter(e.target.value) }}>
                    <option>Default</option>
                    <option value="1">Lowest first</option>
                    <option value="2">Highest first</option>
                </Form.Select>
            </div>
            <h3>{category.name}</h3>
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
            <Page length={Math.ceil(length / 5)} setPage={setPage} page={page}></Page>
        </div>
    );
}

export default Main;