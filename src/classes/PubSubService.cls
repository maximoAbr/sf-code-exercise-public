/**
 * @description A simple Pub/Sub pattern implementation
 */
public with sharing class PubSubService {
    private Map<String, List<IHandleMessages>> channels;
    private PubSubService() { 
        channels = new Map<String, List<IHandleMessages>>();
    }

    /**
     * @description A singleton for service interaction.
     */
    public static PubSubService Instance {
        get {
            if (Instance == null) {
                Instance = new PubSubService();
            }

            return Instance;
        }

        private set;
    }

    /**
     * @description Subscribes a given IHandleMessages implementation to the channels it returns.
     * @param implementation An instance of IHandleMessages.
     * @param channel The name of the channel to unsubscribe from.
     * @throws ArgumentNullException if implementation is null.
     */
    public void subscribe(String channel,IHandleMessages implementation) {
        // TODO: Complete this method
        if (!channels.containsKey(channel)) {
            channels.put(channel, new List<IHandleMessages>());
        }
        channels.get(channel).add(implementation);
    }

    /**
     * @description Un-subscribes a given IHandleMessages implementation to the channels it returns.
     * @param implementation An instance of IHandleMessages.
     * @param channel The name of the channel to unsubscribe from.
     * @throws ArgumentNullException if implementation is null.
     */
    public void unsubscribe(String channel,IHandleMessages implementation) {
        // TODO: Complete this method
        if (channels.containsKey(channel)) {
            channels.get(channel).remove(implementation);
        }
    }

    /**
     * @description Emits a message to a given channel containing the specified data.
     * @param channel The channel to emit a message on.
     * @param data The data to emit.
     * @throws ArgumentNullException if channel is null.
     */
    public void emit(String channel, Object data) {
        // TODO: Complete this method
        if (channels.containsKey(channel)) {
            List<IHandleMessages> handlers = channels.get(channel);
            for (IHandleMessages handler : handlers) {
                handler.handleMessage(data);
            }
        }
    }
}