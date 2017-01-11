ActiveModelSerializers.config.adapter = ActiveModelSerializers::Adapter::JsonApi

# resource_class is the class of the resource being rendered by default serializer_class is ActiveModel::Serializer
# for association lookup it's the "parent" serializer
# namespace correspond to either the controller namespace or the [optionally] specified namespace render option

# ActiveModelSerializers.config.serializer_lookup_chain = [
#     lambda do |resource_class, serializer_class, namespace|
#       "API::#{namespace}::#{resource_class}"
#     end
# ]