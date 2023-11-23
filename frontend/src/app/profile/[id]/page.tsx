'use client'

import axios from "axios"
import { useEffect, useState } from "react"

interface userProfile {
    dob: Date,
    email: string,
    first_name: string,
    last_name: string,
    h_index: number,
    no_citations: number,
    page_visits: number,
    r_id: string,
    nationality: string
}

interface paper {
    conf_id: string,
    conf_name: string,
    doi: string,
    domain: string,
    p_citations: number,
    paper_url: string,
    published_date: Date,
    title: string
}

interface userPapers {
    papers: paper [] | []
}

interface follow {
    first_name: string,
    last_name: string,
    r_id: string
}

interface userSocial {
    following: follow [] | []
    followers: follow [] | []
}

interface userCompany {
    comp_city: string,
    comp_country: string,
    comp_id: string,
    comp_name: string
}

interface userUniversity {
    dep_id: string,
    dep_name: string,
    uni_city: string,
    uni_country: string,
    uni_id: string,
    uni_name: string
}

interface userOrganization {
    org_name: string,
    org_id: string
}

interface userWork {
    comp: null | userCompany,
    uni: null | userUniversity,
    org: null | userOrganization
}

const Profile = ({params}: {params: {id: string}}) => {
    const [userProfile, setUserProfile] = useState<userProfile>({})
    const [userSocial, setUserSocial] = useState<userSocial>({"following": [], "followers": []})
    const [userPapers, setUserPapers] = useState<userPapers>({"papers": []})
    const [userWork, setUserWork] = useState<userWork>({"comp": null, "uni": null, "org": null})

    useEffect(() => {
        axios.get(`http://localhost:5000/profile?r_id=${params.id}`)
            .then(async response => {
                if(!response.data)
                    console.log("error getting profile")
                setUserProfile(response.data)

                axios.get(`http://localhost:5000/papers?r_id=${params.id}`)
                    .then(async response => {
                        if(!response.data)
                            console.log("error getting papers")
                        setUserPapers(response.data)
                        
                        axios.get(`http://localhost:5000/social?r_id=${params.id}`)
                            .then(async response => {
                                if(!response.data)
                                    console.log("error getting social")
                                setUserSocial(response.data)

                                axios.get(`http://localhost:5000/work?r_id=${params.id}`)
                                    .then(async response => {
                                        if(!response.data)
                                            console.log("error getting work")
                                        setUserWork(response.data)
                                    })
                            })
                    })
            })
    }, [params.id])

    const social = {
        /* get information about the followers and following for my r_id*/
        "followers": [
            {'firstName': 'hehe', 'lastName': 'grrr', 'r_id': 'dsjiaodsa'},
            {'firstName': 'hehaw', 'lastName': 'grr', 'r_id': 'dsdshdsa'}
        ],
        "following": [
            {'name': 'hehe', 'r_id': 'dsjiaodsa'},
            {'name': 'hehaw', 'r_id': 'dsdshdsa'}
        ]
    }

    return (
        <div>
            <div className="div-component bg-secondary">
                <h2>{userProfile['first_name']} {userProfile['last_name']}</h2>
            </div>
            <nav className="div-component bg-primary">
                <button>About</button>
                <button>Papers</button>
            </nav>
            <div className="div-component bg-background">
                
            </div>
        </div>
    )
}

export default Profile
