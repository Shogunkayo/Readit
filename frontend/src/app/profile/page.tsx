import conf1 from '@/assets/conf-1.jpg'
import Image from 'next/image'
import Link from 'next/link'

type Props = {}

const Profile = (props: Props) => {
    
    const userProfile = {
        firstName: "Steven",
        lastName: "Chopra",
        workPlace: "Tufts University",
        workTeam: "Department of Civil and Environmental Engineering",
        workURL: "/heheheheheh",
        workRole: "Professor",
        qualification: "PHD",
        nationality: "India",
        publications: ["hehe", "hehaw", "grrr", "lmao"],
        domain: "Artificial Intelligence",
        reads: 139402,
        citations: 3423
    }

    return (
        <div>
            <header>
                <div>
                    <div>
                        <Image alt="hehe" src={conf1}></Image>
                    </div>
                    <div>
                        <h1>{userProfile.firstName} {userProfile.lastName}</h1>
                        {userProfile.workPlace && userProfile.workURL && (
                            <Link href={userProfile.workURL}>{userProfile.workPlace} | {userProfile.workTeam}</Link>
                        )}
                        {userProfile.workPlace && !userProfile.workURL && (
                            <p>{userProfile.workPlace} | {userProfile.workTeam}</p>
                        )}
                        <p>{userProfile.qualification}</p>
                    </div>
                    <div>
                        <button>Contact</button>
                    </div>
                </div>
                <nav>
                    <button>About</button> 
                    <button>Publications</button> 
                    <button>Network</button> 
                </nav>
            </header>
            <div id="about">
                <div>
                    <h3>{userProfile.publications.length}Publications</h3>
                    <h3>{userProfile.reads}Reads</h3>
                    <h3>{userProfile.citations}Citations</h3>
                </div>
            </div>
        </div>
    )
}

export default Profile
