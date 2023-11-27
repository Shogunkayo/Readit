'use client'

import { useState } from "react";

type Props = {}

const Admin = (props: Props) => {
    const tables = ['Country', 'City', 'Researcher', 'Paper', 'TrendingPapers', 'Organization', 'Conference', 'Publish_Conference', 'Belong_To', 'Write_Paper',
        'Citations', 'Follows', 'Work_University', 'Work_Company', 'Company', 'Private_Repository', 'University', 'Company_Repo', 'University_Repo', 'Department',
        'Work_University', 'Work_Company'
    ];

    const dummyData = {
      Country: [
        { country_id: 1, country_name: 'Country 1' },
        { country_id: 2, country_name: 'Country 2' },
        // Add more dummy data as needed
      ],
      City: [
        { city_id: 1, city_name: 'City 1', country_id: 1 },
        { city_id: 2, city_name: 'City 2', country_id: 2 },
        // Add more dummy data as needed
      ],
      Researcher: [
  {
    "r_id": "10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea",
    "last_name": "Zulu",
    "first_name": "Thabo",
    "email": "thabo.zulu@email.com",
    "h_index": 5,
    "no_citations": 50,
    "date_created": "2023-11-23 12:45:00",
    "dob": "2023-11-04",
    "page_visits": 25,
    "nationality": 10,
    "role": "user"
  },
  {
    "r_id": "1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1",
    "last_name": "Smith",
    "first_name": "John",
    "email": "john.smith@email.com",
    "h_index": 10,
    "no_citations": 100,
    "date_created": "2023-11-23 12:00:00",
    "dob": "2023-11-04",
    "page_visits": 56,
    "nationality": 1,
    "role": "user"
  },
  {
    "r_id": "2b8d924a-725e-49ec-aa79-1b6e44e17e34",
    "last_name": "Johnson",
    "first_name": "Emily",
    "email": "emily.johnson@email.com",
    "h_index": 8,
    "no_citations": 80,
    "date_created": "2023-11-23 12:05:00",
    "dob": "2023-11-04",
    "page_visits": 40,
    "nationality": 2,
    "role": "user"
  },
  {
    "r_id": "3c9eab53-62bf-46b5-b86b-3d93321c1e7e",
    "last_name": "Williams",
    "first_name": "David",
    "email": "david.williams@email.com",
    "h_index": 12,
    "no_citations": 120,
    "date_created": "2023-11-23 12:10:00",
    "dob": "2023-11-04",
    "page_visits": 60,
    "nationality": 3,
    "role": "user"
  },
  {
    "r_id": "4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4",
    "last_name": "Müller",
    "first_name": "Anna",
    "email": "anna.muller@email.com",
    "h_index": 9,
    "no_citations": 90,
    "date_created": "2023-11-23 12:15:00",
    "dob": "2023-11-04",
    "page_visits": 45,
    "nationality": 4,
    "role": "user"
  },
  {
    "r_id": "5e2aeb18-59b7-4f7c-b169-8d96f470c5a2",
    "last_name": "Dubois",
    "first_name": "Lucas",
    "email": "lucas.dubois@email.com",
    "h_index": 11,
    "no_citations": 110,
    "date_created": "2023-11-23 12:20:00",
    "dob": "2023-11-04",
    "page_visits": 55,
    "nationality": 5,
    "role": "user"
  },
  {
    "r_id": "6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d",
    "last_name": "Smith",
    "first_name": "Olivia",
    "email": "olivia.smith@email.com",
    "h_index": 7,
    "no_citations": 70,
    "date_created": "2023-11-23 12:25:00",
    "dob": "2023-11-04",
    "page_visits": 35,
    "nationality": 6,
    "role": "user"
  },
  {
    "r_id": "7g0c83b2-1d2e-4a74-9b4b-3286894c70a3",
    "last_name": "Sato",
    "first_name": "Kenji",
    "email": "kenji.sato@email.com",
    "h_index": 14,
    "no_citations": 140,
    "date_created": "2023-11-23 12:30:00",
    "dob": "2023-11-04",
    "page_visits": 70,
    "nationality": 7,
    "role": "user"
  },
  {
    "r_id": "8c44943e-89ab-11ee-9d1a-005056c00001",
    "last_name": "Atreyas",
    "first_name": "Gautham",
    "email": "gautham@gmail.com",
    "h_index": 0,
    "no_citations": 0,
    "date_created": "2023-11-23 08:23:58",
    "dob": "2023-11-16",
    "page_visits": 2,
    "nationality": 9,
    "role": "user"
  },
  {
    "r_id": "8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8",
    "last_name": "Silva",
    "first_name": "Maria",
    "email": "maria.silva@email.com",
    "h_index": 13,
    "no_citations": 130,
    "date_created": "2023-11-23 12:35:00",
    "dob": "2023-11-04",
    "page_visits": 65,
    "nationality": 8,
    "role": "user"
  },
  {
    "r_id": "9i4d20b8-2a94-429e-9a4a-5769667e1701",
    "last_name": "Reddy",
    "first_name": "Raj",
    "email": "raj.reddy@email.com",
    "h_index": 6,
    "no_citations": 60,
    "date_created": "2023-11-23 12:40:00",
    "dob": "2023-11-04",
    "page_visits": 30,
    "nationality": 9,
    "role": "user"
  },
  {
    "r_id": "b40e3722-89ab-11ee-8d85-005056c00001",
    "last_name": "mayya",
    "first_name": "ganesh",
    "email": "ganesh@gmail.com",
    "h_index": 0,
    "no_citations": 0,
    "date_created": "2023-11-23 08:25:04",
    "dob": "2023-11-02",
    "page_visits": 16,
    "nationality": 9,
    "role": "user"
  }
]
,
      Paper: [
        { doi: 'doi1', domain: 'Domain 1', title: 'Title 1' },
        { doi: 'doi2', domain: 'Domain 2', title: 'Title 2' },
        // Add more dummy data as needed
      ],
      TrendingPapers: [
        { doi: 'doi1', trend_score: 10 },
        { doi: 'doi2', trend_score: 15 },
        // Add more dummy data as needed
      ],
    };


    const [selectedTable, setSelectedTable] = useState('');
    const [data, setData] = useState([]);

    const fetchData = (table: any) => {
        setSelectedTable(table);
        setData(dummyData[table] || []);
    };

    return (
        <div>
            <nav className="div-component bg-secondary">
                {tables.map((table, idx) => (
                    <button className="button-primary" key={idx} onClick={() => fetchData(table)}>{table}</button>
                ))}
            </nav>
            {selectedTable && (
                <div className="div-component bg-background">
                    <h2 className="text-primary text-2xl">{selectedTable} Data:</h2>
                     <table className="table-auto w-full border-collapse border border-secondary">
            <thead>
              <tr className="bg-primary text-white">
                {Object.keys(data[0] || {}).map((key) => (
                  <th key={key} className="p-2 border border-secondary">
                    {key}
                  </th>
                ))}
                <th className="p-2 border border-secondary">Actions</th>
              </tr>
            </thead>
            <tbody>
              {data.map((row, index) => (
                <tr key={index} className="bg-background">
                  {Object.values(row).map((value, colIndex) => (
                    <td key={colIndex} className="p-2 border border-secondary">
                      {value}
                    </td>
                  ))}
                  <td className="p-2 border border-secondary">
                    <button className="bg-secondary">Delete</button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
                </div>
      )}
    </div>
    )
}

export default Admin 
