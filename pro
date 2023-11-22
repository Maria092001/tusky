const user = {
    lastActivityTime: null,
    posts: []
};

function createPost(post) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            user.posts.push(post);
            resolve();
        }, 1000);
    });
}

function updateLastUserActivityTime() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            user.lastActivityTime = new Date();
            resolve(user.lastActivityTime);
        }, 1000);
    });
}

function deletePost() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            if (user.posts.length > 0) {
                user.posts.pop();
                resolve();
            } else {
                reject("No posts to delete");
            }
        }, 1000);
    });
}

// Usage example
async function main() {
    // Create a post and update last activity time
    await Promise.all([createPost({ title: "Post1" }), updateLastUserActivityTime()]);

    // Create another post and update last activity time
    await Promise.all([createPost({ title: "Post2" }), updateLastUserActivityTime()]);

    // Log all posts and last activity time
    console.log("All Posts:", user.posts);
    console.log("Last Activity Time:", user.lastActivityTime);

    // Delete the last post
    try {
        await deletePost();
        console.log("Post Deleted Successfully");
    } catch (error) {
        console.log("Error Deleting Post:", error);
    }

    // Log the remaining posts
    console.log("Remaining Posts:", user.posts);
}

main();
