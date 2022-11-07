import { Form, Pagination } from "react-bootstrap";
import { useEffect, useState } from 'react'
import { useDispatch} from "react-redux";
import { useNavigate, useParams } from "react-router-dom";
import "./Main.css";
import { Category, PostShow } from "../../../model";
import { getPost } from "../../../redux/apiRequest";
import { currencyMaskString } from "../../../mask";
import _ from 'lodash';

const Filter = () => {
    const params = useParams();
    const [posts, setPosts] = useState<PostShow[]>([]);
    const [allPosts, setAllPosts] = useState<PostShow[]>([]);
    const [page, setPage] = useState<number>(1);
    const [filter, setFilter] = useState<string>();
    const navigate = useNavigate();
    const dispatch = useDispatch();
    const [category, setCategory] = useState<Category>({
        id: "",
        name: "All Categories",
        icon: "https://pic.onlinewebfonts.com/svg/img_123607.png"
    });
    useEffect(() => {
        fetchData();
    }, [page, filter]);

    async function fetchData() {
        const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/posts/catecories?id=${params.id}&page=${page}&pageSize=5`);
        const data = await response.json();
        handleFilter(data.data);
        const res = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/posts/catecories?id=${params.id}`);
        const resData = await res.json();
        setAllPosts(resData.data);
        const resCategory = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/categories/${params.id}`);
        const dataCategory = await resCategory.json();
        setCategory(dataCategory.data);
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

    const handleFilter = (posts: PostShow[]) => {
        console.log(posts);
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

    const redirectProduct = (post: PostShow) => {
        getPost(post, dispatch, navigate);
    }
    return (
        <div id="Main" className="right-side">
            <div className="nav-title">
                <h3>{category?.name}</h3>
                <Form.Select aria-label="Default select example" className="filter" onChange={(e)=>{setFilter(e.target.value)}}>
                    <option>Default</option>
                    <option value="1">Lowest</option>
                    <option value="2">Highest</option>
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

export default Filter;