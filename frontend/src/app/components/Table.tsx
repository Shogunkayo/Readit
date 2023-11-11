type Props = {
    data: any []
    columns: string []
}

const Table = (props: Props) => {
    return (
        <div className="overflow-x-hidden z-20">
            <table className="w-[90%] m-auto border-separate rounded-3xl">
                <thead>
                    <tr className="bg-secondary">
                        {props.columns.map((column, index) => (
                            <th key={index} className={`py-2 px-4 text-text
                                ${index === 0 && "rounded-tl-3xl"}
                                ${index === props.columns.length - 1 && "rounded-tr-3xl"}`}
                            >{column}
                            </th>
                        ))}
                    </tr>
                </thead>
                <tbody>
                    {props.data.map((item, rowIndex) => (
                        <tr key={rowIndex} className={rowIndex % 2 === 0 ? 'bg-primary' : 'bg-secondary'}>
                            {props.columns.map((column, colIndex) => (
                                <td key={colIndex} className={`py-3 px-4 text-text 
                                    ${rowIndex === props.data.length - 1 && colIndex === 0 && "rounded-bl-3xl"}
                                    ${rowIndex === props.data.length - 1 && colIndex === props.columns.length - 1 && "rounded-br-3xl"}`}
                                >{item[column.toLowerCase()]}
                                </td>
                            ))}
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}

export default Table
