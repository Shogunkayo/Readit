import axios from "axios"
import { toast } from "react-toastify"

const Profile = ({params}: {params: {id: string}}) => {
    const res = axios.get(`http://localhost:5000/profile?r_id=${params.id}`)
        .then(async response => {
            if(!response.data)
                console.log("error getting profile")
            console.log(response.data)
            return response.data
        })

    const userProfile = {
        /* retrieve this information */
        firstName: "Steven",
        lastName: "Chopra",
        nationality: "India",
        reads: 139402,
        citations: 3423,
        hIndex: 10,
        email: "hehe@gmail.com"
    }

    const userInfo = {
        /* get the first name, last name, email, h index, no reads, no papers,
         * email, nationality and the no citations for a particular r_id */
    }

    const universityInfo = {
        /* if r_id working in a university, get the uni name, uni country,
         * and department name */
    }

    const companyInfo = {
        /* if r_id working in a company, get the company name */
    }

    const orgInfo = {
        /* if r_id working in an organization, get the organization name */
    }

    const papers = {
        /* get the following details from the papers publised by the r_id: 
         * paper title, no of citations for that paper, paper domain and the 
         * conference name if it was published */
    }
    
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
                <h2>{userProfile.firstName} {userProfile.lastName}</h2>
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
