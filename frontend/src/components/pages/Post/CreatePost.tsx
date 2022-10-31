import "./CreatePost.css";
import React, { FormEvent, useState, useEffect } from 'react';
import { Form } from "react-bootstrap";
import { Category, Post } from "../../../model";
import { useSelector } from "react-redux";
import axios from 'axios';

const CreatePost: React.FC = props => {
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const [post, setPost] = useState<Post>({
        title: "",
        postDescription: "",
        imageUrl: "",
        accountId: user.id,
        price: 0,
        buildingId: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        productName: "",
        productDescription: "",
        quantity: 0,
        categoryId: ""
    });
    const [currentCategory, setCurrentCategory] = useState<any>();
    const [preview, isPreview] = useState<String>("Preview");
    const [categories, setCategories] = useState<Category[]>([]);

    useEffect(() => {
        fetchData();
    }, []);

    async function fetchData() {
        const response = await fetch("https://localhost:5001/api/categories");
        const data = await response.json();
        setCategories(data.data);
    }

    const uploadPost = async () => {
       try {
        const res = await axios.post("https://localhost:5001/api/posts", post, {
            headers: { 
                Authorization: `Bearer ${user?.jwtToken}`,
                'Content-Type': 'application/json'
         },
        });
       } catch (error) {
            console.log(error);
       }
    }

    const renderSwitch = () => {
        switch (preview) {
            case "Preview":
                return (
                    <div className="post-wrap">
                        <div className="post-img">
                            <div className="input-img" onClick={(e) => {
                                document.getElementById("img-file")?.click();
                            }}>
                                <input type="file" id="img-file" style={{ display: "none" }}/>
                                <div className="s6ete4"><svg xmlns="http://www.w3.org/2000/svg" width="53" height="39" viewBox="0 0 53 39">
                                    <g fill="none" fillRule="evenodd" stroke="none" strokeWidth="1"><g stroke="#FE9900" strokeWidth="2" transform="translate(-255 -179)"><g transform="translate(132 122)"><path d="M150.631 87.337c-5.755 0-10.42-4.534-10.42-10.127 0-5.593 4.665-10.127 10.42-10.127s10.42 4.534 10.42 10.127c0 5.593-4.665 10.127-10.42 10.127m10.42-24.755l-2.315-4.501h-16.21l-2.316 4.5h-11.579s-4.631 0-4.631 4.502v22.505c0 4.5 4.631 4.5 4.631 4.5h41.684s4.631 0 4.631-4.5V67.083c0-4.501-4.631-4.501-4.631-4.501h-9.263z"></path></g></g></g></svg><span className="ffyigpx"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 20 21"><g fill="none" fillRule="evenodd" stroke="none" strokeWidth="1"><g fill="#FE9900" transform="translate(-161 -428)"><g transform="translate(132 398)"><g transform="translate(16.648 17.048)"><g transform="rotate(-180 16.142 16.838)"><rect width="2.643" height="19.82" x="8.588" y="0" rx="1.321"></rect><path d="M9.91 0c.73 0 1.321.592 1.321 1.321v17.177a1.321 1.321 0 01-2.643 0V1.321C8.588.591 9.18 0 9.91 0z" transform="rotate(90 9.91 9.91)"></path></g></g></g></g></g></svg></span>
                                </div>
                            </div>
                        </div>
                        <div className="post-data">
                            <h1>Post details</h1>
                            <div className="input inline-block">
                                <div className="input-title">Category</div>
                                <Form.Select className="input-value" style={{ display: "inline-block" }} onChange={(e) => {
                                    post.categoryId = e.target.value.split("  ")[0];
                                    setCurrentCategory(e.target.value.split("  ")[1])
                                    console.log(currentCategory);
                                }
                                }>
                                    <option>Select Category</option>
                                    {
                                        categories?.map((item, index) => {
                                            return  (
                                                <option key={index} value={`${item.id}  ${item.name}`}>{item.name}</option>
                                            )
                                        })
                                    }
                                </Form.Select>
                            </div>
                            <div className="input inline-block">
                                <div className="input-title">ImageUrl</div>
                                <input type="text" className="input-value" onChange={(e) => {post.imageUrl = e.target.value}} placeholder={post.imageUrl}/>
                            </div>
                            <div className="input inline-block">
                                <div className="input-title">Post title</div>
                                <input type="text" className="input-value" onChange={(e) => {post.title = e.target.value}} placeholder={post.title}/>
                            </div>
                            <div className="input inline-block">
                                <div className="input-title">Product name</div>
                                <input type="text" className="input-value" onChange={(e) => {post.productName = e.target.value}} placeholder={post.productName}/>
                            </div>
                            <div className="input inline-block">
                                <div className="input-title">Regular price ($)</div>
                                <input type="text" className="input-value" onChange={(e) => {post.price = parseInt(e.target.value)}} placeholder={`${post.price}`}/>
                            </div>
                            <div className="input inline-block">
                                <div className="input-title">Stock quantity</div>
                                <input type="text" className="input-value" onChange={(e) => {post.quantity = parseInt(e.target.value)}} placeholder={`${post.quantity}`}/>
                            </div>
                            <div className="input inline-block flex">
                                <div className="input-title">Description</div>
                                <textarea className="input-value" onChange={(e) => {post.postDescription = e.target.value}} placeholder={post.postDescription}/>
                            </div>
                            <div className="input inline-block flex mt-180">
                                <div className="input-title">Product Description</div>
                                <textarea className="input-value" onChange={(e) => {post.productDescription = e.target.value}} placeholder={post.productDescription}/>
                            </div>
                            <div className="btn-wrap mt-250">
                                <button className="btn-preview-edit" onClick={() => { (preview) == "Preview" ? isPreview("Edit post") : isPreview("Preview"); console.log(post) }}>{preview}</button>
                                <button className="btn-upload" onClick={uploadPost}>Upload</button>
                            </div>
                        </div>
                    </div>
                )
            case "Edit post":
                return (
                    <div>
                        <div className="border">
                            <div className="product-type">
                                <div className="product-img">
                                    <img src={post.imageUrl} alt="" />
                                </div>
                                <div className="product-summary">
                                    <h1 className="product-name">{post.title}</h1>
                                    <div className="product-price">{`${post.price} đ`}</div>
                                    <button className="btn-addtocart">add to cart</button>
                                    <h4>SPECS</h4>
                                    <div className="product-information">
                                        <span className="category-wrapper">
                                            <span className="product-att-title">Category:</span>
                                            <span className="product-att">{currentCategory}</span>
                                        </span>
                                        <span className="availability-wrapper">
                                            <span className="product-att-title">Availability:</span>
                                            <span className="product-att">{`${post.quantity}`}</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="border">
                            <div className="p-32">
                                <h3>Description</h3>
                                <div className="description">{post.postDescription}</div>
                            </div>
                        </div>
                        <div className="border">
                            <div className="p-32">
                                <h3>Product Details</h3>
                                <div className="description">{post.productDescription}</div>
                            </div>
                        </div>
                        <div className="btn-wrap">
                            <button className="btn-preview-edit" onClick={() => { (preview) == "Preview" ? isPreview("Edit post") : isPreview("Preview") }}>{preview}</button>
                            <button className="btn-upload" onClick={uploadPost}>Upload</button>
                        </div>

                    </div>
                )
        }
    }
    return (
        <div id="CreatePost" className="right-side clear-fix">
            <h1 style={{ fontSize: "32px" }} >Create your post</h1>
            {renderSwitch()}
        </div>
    );
}
export default CreatePost;