# rSUNC and UNC

rSUNC remains partly compatible with the now old UNC, it is _partly_ compatible due to the fact some functions, such as the entirety of the `cache` library, has been replaced by the `instances` library, with the functions it once contained renamed to be far more descriptive.

The documentation also attempts to be as descriptive as possible as to what the function should do, the arguments it should take, and the errors that they should throw on unique cases. This allows script developers to use `pcall` and obtain the error if applicable, and attempt to handle them in some way by themselves. This also allows executor developers to know how a function should behave and what it should do.