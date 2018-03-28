byte_stream is a header-only template function library using C++11 variadic templates to perform simple serialization/deserialization of POD datatypes.

This is mostly a thought experiment and could likely be extended in various ways to be more useful, but it allows serialization of data to be used with MPI pretty easily which is most of what it is currently used for. The concept could be extended with a couple pure-virtual interface classes to provide common interfaces for serialization/deserialization to make moving POD (or deep-copy if any contained data members which are not POD also implement the interface) objects around using MPI very straightforward.

In practice you should just be able to serialize a POD type by calling
```
PODtype obj;
void * bfr = talloc(obj);
byte_pack(bfr,obj);
```
But since the underlying POD type memory layout (including padding) is dependent on your compiler you might wind up allocating more memory than is stricly necessary to capture the state of the object, this usually doesn't matter unless you really want to minimize the memory footprint (if there are many objects to serialize, etc).

Of course if this is being used with MPI you can always define an MPI_Datatype for the POD objects and just send them as-is. I just don't much like creating MPI_Datatypes and having to remember to change their layout in the event the POD datastructure changes, since this is essentially duplicating information in multiple places in code.
