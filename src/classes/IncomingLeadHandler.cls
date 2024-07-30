/**
 * @description An implementation of IHandleMessages which validates the passed in Lead and inserts it.
 */
public with sharing class IncomingLeadHandler implements IHandleMessages {
    @testVisible private static final String INCOMING_LEAD_CHANNEL = 'IncomingLeads';
    @testVisible private static final String INVALID_LEAD_ERROR = 'The Lead specified is invalid.';
    @testVisible private static final String CHANNEL_PARAM = 'channel';

    /**
     * @description Constructs an instance of IncomingLeadHandler.
     */
    public IncomingLeadHandler() { }

    /**
     * @description Handles a message on a subscribed channel.
     * @param channel The channel emitting the message.
     * @param data The accompanying data for the message.
     * @throws ArgumentNullException if channel is null.
     * @throws ArgumentException if the lead is missing a FirstName.
     */
    public void handleMessage(String channel, Object data) {
        // TODO: Complete this method
    if (channel == null) {
            throw new ArgumentNullException('Channel cannot be null');
        }

        if (data instanceof Lead) {
            Lead lead = (Lead) data;
            if (isValidLead(lead)) {
                throw new ArgumentException('Lead is missing a FirstName');
            }
            insert lead;
        }
    }

     /**
     * @description Checks if the lead is valid (i.e., has a non-null FirstName).
     * @param lead The lead to be validated.
     * @return Boolean indicating if the lead is valid.
     */
    private Boolean isValidLead(Lead lead) {
        return lead.FirstName != null;
    }

    /**
     * @description Gets a list of channels an implementation subscribes to.
     * @return A List<String> of channel names this implementation is subscribed to.
     */
    public List<String> getSubscribedChannels() {
        // TODO: Complete this method
        return new List<String>{ INCOMING_LEAD_CHANNEL };
    }
}