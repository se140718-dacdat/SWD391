import React, { Dispatch, FC, SetStateAction, useState } from 'react';
import { Pagination } from 'react-bootstrap';
interface Props {
    length: number;
    page: number;
    setPage: Dispatch<SetStateAction<number>>
}
const Page: FC<Props> = props => {
    let items: any = [];
    for (let number = 1; number <= props.length; number++) {
        items.push(
            <Pagination.Item onClick={() => { props.setPage(number) }} key={number} active={number === props.page}>
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
export default Page
