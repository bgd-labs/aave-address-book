// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IRescuable} from './IRescuable.sol';

library EnumerableSet {
  // To implement this library for multiple types with as little code
  // repetition as possible, we write it in terms of a generic Set type with
  // bytes32 values.
  // The Set implementation uses private functions, and user-facing
  // implementations (such as AddressSet) are just wrappers around the
  // underlying Set.
  // This means that we can only create new EnumerableSets for types that fit
  // in bytes32.

  struct Set {
    // Storage of set values
    bytes32[] _values;
    // Position of the value in the `values` array, plus 1 because index 0
    // means a value is not in the set.
    mapping(bytes32 => uint256) _indexes;
  }

  /**
   * @dev Add a value to a set. O(1).
   *
   * Returns true if the value was added to the set, that is if it was not
   * already present.
   */
  function _add(Set storage set, bytes32 value) private returns (bool) {
    if (!_contains(set, value)) {
      set._values.push(value);
      // The value is stored at length-1, but we add 1 to all indexes
      // and use 0 as a sentinel value
      set._indexes[value] = set._values.length;
      return true;
    } else {
      return false;
    }
  }

  /**
   * @dev Removes a value from a set. O(1).
   *
   * Returns true if the value was removed from the set, that is if it was
   * present.
   */
  function _remove(Set storage set, bytes32 value) private returns (bool) {
    // We read and store the value's index to prevent multiple reads from the same storage slot
    uint256 valueIndex = set._indexes[value];

    if (valueIndex != 0) {
      // Equivalent to contains(set, value)
      // To delete an element from the _values array in O(1), we swap the element to delete with the last one in
      // the array, and then remove the last element (sometimes called as 'swap and pop').
      // This modifies the order of the array, as noted in {at}.

      uint256 toDeleteIndex = valueIndex - 1;
      uint256 lastIndex = set._values.length - 1;

      if (lastIndex != toDeleteIndex) {
        bytes32 lastValue = set._values[lastIndex];

        // Move the last value to the index where the value to delete is
        set._values[toDeleteIndex] = lastValue;
        // Update the index for the moved value
        set._indexes[lastValue] = valueIndex; // Replace lastValue's index to valueIndex
      }

      // Delete the slot where the moved value was stored
      set._values.pop();

      // Delete the index for the deleted slot
      delete set._indexes[value];

      return true;
    } else {
      return false;
    }
  }

  /**
   * @dev Returns true if the value is in the set. O(1).
   */
  function _contains(Set storage set, bytes32 value) private view returns (bool) {
    return set._indexes[value] != 0;
  }

  /**
   * @dev Returns the number of values on the set. O(1).
   */
  function _length(Set storage set) private view returns (uint256) {
    return set._values.length;
  }

  /**
   * @dev Returns the value stored at position `index` in the set. O(1).
   *
   * Note that there are no guarantees on the ordering of values inside the
   * array, and it may change when more values are added or removed.
   *
   * Requirements:
   *
   * - `index` must be strictly less than {length}.
   */
  function _at(Set storage set, uint256 index) private view returns (bytes32) {
    return set._values[index];
  }

  /**
   * @dev Return the entire set in an array
   *
   * WARNING: This operation will copy the entire storage to memory, which can be quite expensive. This is designed
   * to mostly be used by view accessors that are queried without any gas fees. Developers should keep in mind that
   * this function has an unbounded cost, and using it as part of a state-changing function may render the function
   * uncallable if the set grows to a point where copying to memory consumes too much gas to fit in a block.
   */
  function _values(Set storage set) private view returns (bytes32[] memory) {
    return set._values;
  }

  // Bytes32Set

  struct Bytes32Set {
    Set _inner;
  }

  /**
   * @dev Add a value to a set. O(1).
   *
   * Returns true if the value was added to the set, that is if it was not
   * already present.
   */
  function add(Bytes32Set storage set, bytes32 value) internal returns (bool) {
    return _add(set._inner, value);
  }

  /**
   * @dev Removes a value from a set. O(1).
   *
   * Returns true if the value was removed from the set, that is if it was
   * present.
   */
  function remove(Bytes32Set storage set, bytes32 value) internal returns (bool) {
    return _remove(set._inner, value);
  }

  /**
   * @dev Returns true if the value is in the set. O(1).
   */
  function contains(Bytes32Set storage set, bytes32 value) internal view returns (bool) {
    return _contains(set._inner, value);
  }

  /**
   * @dev Returns the number of values in the set. O(1).
   */
  function length(Bytes32Set storage set) internal view returns (uint256) {
    return _length(set._inner);
  }

  /**
   * @dev Returns the value stored at position `index` in the set. O(1).
   *
   * Note that there are no guarantees on the ordering of values inside the
   * array, and it may change when more values are added or removed.
   *
   * Requirements:
   *
   * - `index` must be strictly less than {length}.
   */
  function at(Bytes32Set storage set, uint256 index) internal view returns (bytes32) {
    return _at(set._inner, index);
  }

  /**
   * @dev Return the entire set in an array
   *
   * WARNING: This operation will copy the entire storage to memory, which can be quite expensive. This is designed
   * to mostly be used by view accessors that are queried without any gas fees. Developers should keep in mind that
   * this function has an unbounded cost, and using it as part of a state-changing function may render the function
   * uncallable if the set grows to a point where copying to memory consumes too much gas to fit in a block.
   */
  function values(Bytes32Set storage set) internal view returns (bytes32[] memory) {
    bytes32[] memory store = _values(set._inner);
    bytes32[] memory result;

    /// @solidity memory-safe-assembly
    assembly {
      result := store
    }

    return result;
  }

  // AddressSet

  struct AddressSet {
    Set _inner;
  }

  /**
   * @dev Add a value to a set. O(1).
   *
   * Returns true if the value was added to the set, that is if it was not
   * already present.
   */
  function add(AddressSet storage set, address value) internal returns (bool) {
    return _add(set._inner, bytes32(uint256(uint160(value))));
  }

  /**
   * @dev Removes a value from a set. O(1).
   *
   * Returns true if the value was removed from the set, that is if it was
   * present.
   */
  function remove(AddressSet storage set, address value) internal returns (bool) {
    return _remove(set._inner, bytes32(uint256(uint160(value))));
  }

  /**
   * @dev Returns true if the value is in the set. O(1).
   */
  function contains(AddressSet storage set, address value) internal view returns (bool) {
    return _contains(set._inner, bytes32(uint256(uint160(value))));
  }

  /**
   * @dev Returns the number of values in the set. O(1).
   */
  function length(AddressSet storage set) internal view returns (uint256) {
    return _length(set._inner);
  }

  /**
   * @dev Returns the value stored at position `index` in the set. O(1).
   *
   * Note that there are no guarantees on the ordering of values inside the
   * array, and it may change when more values are added or removed.
   *
   * Requirements:
   *
   * - `index` must be strictly less than {length}.
   */
  function at(AddressSet storage set, uint256 index) internal view returns (address) {
    return address(uint160(uint256(_at(set._inner, index))));
  }

  /**
   * @dev Return the entire set in an array
   *
   * WARNING: This operation will copy the entire storage to memory, which can be quite expensive. This is designed
   * to mostly be used by view accessors that are queried without any gas fees. Developers should keep in mind that
   * this function has an unbounded cost, and using it as part of a state-changing function may render the function
   * uncallable if the set grows to a point where copying to memory consumes too much gas to fit in a block.
   */
  function values(AddressSet storage set) internal view returns (address[] memory) {
    bytes32[] memory store = _values(set._inner);
    address[] memory result;

    /// @solidity memory-safe-assembly
    assembly {
      result := store
    }

    return result;
  }

  // UintSet

  struct UintSet {
    Set _inner;
  }

  /**
   * @dev Add a value to a set. O(1).
   *
   * Returns true if the value was added to the set, that is if it was not
   * already present.
   */
  function add(UintSet storage set, uint256 value) internal returns (bool) {
    return _add(set._inner, bytes32(value));
  }

  /**
   * @dev Removes a value from a set. O(1).
   *
   * Returns true if the value was removed from the set, that is if it was
   * present.
   */
  function remove(UintSet storage set, uint256 value) internal returns (bool) {
    return _remove(set._inner, bytes32(value));
  }

  /**
   * @dev Returns true if the value is in the set. O(1).
   */
  function contains(UintSet storage set, uint256 value) internal view returns (bool) {
    return _contains(set._inner, bytes32(value));
  }

  /**
   * @dev Returns the number of values in the set. O(1).
   */
  function length(UintSet storage set) internal view returns (uint256) {
    return _length(set._inner);
  }

  /**
   * @dev Returns the value stored at position `index` in the set. O(1).
   *
   * Note that there are no guarantees on the ordering of values inside the
   * array, and it may change when more values are added or removed.
   *
   * Requirements:
   *
   * - `index` must be strictly less than {length}.
   */
  function at(UintSet storage set, uint256 index) internal view returns (uint256) {
    return uint256(_at(set._inner, index));
  }

  /**
   * @dev Return the entire set in an array
   *
   * WARNING: This operation will copy the entire storage to memory, which can be quite expensive. This is designed
   * to mostly be used by view accessors that are queried without any gas fees. Developers should keep in mind that
   * this function has an unbounded cost, and using it as part of a state-changing function may render the function
   * uncallable if the set grows to a point where copying to memory consumes too much gas to fit in a block.
   */
  function values(UintSet storage set) internal view returns (uint256[] memory) {
    bytes32[] memory store = _values(set._inner);
    uint256[] memory result;

    /// @solidity memory-safe-assembly
    assembly {
      result := store
    }

    return result;
  }
}

/**
 * @notice Object with the necessary information to define a unique envelope
 * @param nonce sequential (unique) numeric indicator of the Envelope creation
 * @param origin address that originated the bridging of a message
 * @param destination address where the message needs to be sent
 * @param originChainId id of the chain where the message originated
 * @param destinationChainId id of the chain where the message needs to be bridged
 * @param message bytes that needs to be bridged
 */
struct Envelope {
  uint256 nonce;
  address origin;
  address destination;
  uint256 originChainId;
  uint256 destinationChainId;
  bytes message;
}

/**
 * @notice Object containing the information of an envelope for internal usage
 * @param data bytes of the encoded envelope
 * @param id hash of the encoded envelope
 */
struct EncodedEnvelope {
  bytes data;
  bytes32 id;
}

/**
 * @title EnvelopeUtils library
 * @author BGD Labs
 * @notice Defines utility functions for Envelopes
 */
library EnvelopeUtils {
  /**
   * @notice method that encodes an Envelope and generates its id
   * @param envelope object with the routing information necessary to send a message to a destination chain
   * @return object containing the encoded envelope and the envelope id
   */
  function encode(Envelope memory envelope) internal pure returns (EncodedEnvelope memory) {
    EncodedEnvelope memory encodedEnvelope;
    encodedEnvelope.data = abi.encode(envelope);
    encodedEnvelope.id = getId(encodedEnvelope.data);
    return encodedEnvelope;
  }

  /**
   * @notice method to decode and encoded envelope to its raw parameters
   * @param envelope bytes with the encoded envelope data
   * @return object with the decoded envelope information
   */
  function decode(bytes memory envelope) internal pure returns (Envelope memory) {
    return abi.decode(envelope, (Envelope));
  }

  /**
   * @notice method to get an envelope's id
   * @param envelope object with the routing information necessary to send a message to a destination chain
   * @return hash id of the envelope
   */
  function getId(Envelope memory envelope) internal pure returns (bytes32) {
    EncodedEnvelope memory encodedEnvelope = encode(envelope);
    return encodedEnvelope.id;
  }

  /**
   * @notice method to get an envelope's id
   * @param envelope bytes with the encoded envelope data
   * @return hash id of the envelope
   */
  function getId(bytes memory envelope) internal pure returns (bytes32) {
    return keccak256(envelope);
  }
}

/**
 * @notice Object with the necessary information to send an envelope to a bridge
 * @param nonce sequential (unique) numeric indicator of the Transaction creation
 * @param encodedEnvelope bytes of an encoded envelope object
 */
struct Transaction {
  uint256 nonce;
  bytes encodedEnvelope;
}

/**
 * @notice Object containing the information of a transaction for internal usage
 * @param data bytes of the encoded transaction
 * @param id hash of the encoded transaction
 */
struct EncodedTransaction {
  bytes data;
  bytes32 id;
}

/**
 * @title TransactionUtils library
 * @author BGD Labs
 * @notice Defines utility functions for Transactions
 */
library TransactionUtils {
  /**
   * @notice method that encodes a Transaction and generates its id
   * @param transaction object with the information necessary to send an envelope to a bridge
   * @return object containing the encoded transaction and the transaction id
   */
  function encode(
    Transaction memory transaction
  ) internal pure returns (EncodedTransaction memory) {
    EncodedTransaction memory encodedTransaction;
    encodedTransaction.data = abi.encode(transaction);
    encodedTransaction.id = getId(encodedTransaction.data);
    return encodedTransaction;
  }

  /**
   * @notice method that decodes an encoded transaction (bytes) into a Transaction object
   * @param transaction encoded transaction object
   * @return object containing the decoded Transaction object
   */
  function decode(bytes memory transaction) internal pure returns (Transaction memory) {
    return abi.decode(transaction, (Transaction));
  }

  /**
   * @notice method to get a transaction id
   * @param transaction object with the information necessary to send an envelope to a bridge
   * @return hash id of the transaction
   */
  function getId(Transaction memory transaction) internal pure returns (bytes32) {
    EncodedTransaction memory encodedTransaction = encode(transaction);
    return encodedTransaction.id;
  }

  /**
   * @notice method to get a transaction id
   * @param transaction encoded transaction object
   * @return hash id of the transaction
   */
  function getId(bytes memory transaction) internal pure returns (bytes32) {
    return keccak256(transaction);
  }

  /**
   * @notice method to get the envelope information from the transaction object
   * @param transaction object with the information necessary to send an envelope to a bridge
   * @return object with decoded information of the envelope in the transaction
   */
  function getEnvelope(Transaction memory transaction) internal pure returns (Envelope memory) {
    return EnvelopeUtils.decode(transaction.encodedEnvelope);
  }

  /**
   * @notice method to get the envelope id from the transaction object
   * @param transaction object with the information necessary to send an envelope to a bridge
   * @return hash id of the envelope on a transaction
   */
  function getEnvelopeId(Transaction memory transaction) internal pure returns (bytes32) {
    return EnvelopeUtils.getId(transaction.encodedEnvelope);
  }
}

interface ICrossChainReceiver {
  /**
   * @notice object with information to set new required confirmations
   * @param chainId id of the origin chain
   * @param requiredConfirmations required confirmations to set a message as confirmed
   */
  struct ConfirmationInput {
    uint256 chainId;
    uint8 requiredConfirmations;
  }

  /**
   * @notice object with information to set new validity timestamp
   * @param chainId id of the origin chain
   * @param validityTimestamp new timestamp in seconds to set as validity point
   */
  struct ValidityTimestampInput {
    uint256 chainId;
    uint120 validityTimestamp;
  }

  /**
   * @notice object with necessary information to configure bridge adapters
   * @param bridgeAdapter address of the bridge adapter to configure
   * @param chainIds array of ids of the chains the adapter receives messages from
   */
  struct ReceiverBridgeAdapterConfigInput {
    address bridgeAdapter;
    uint256[] chainIds;
  }

  /**
   * @notice object containing the receiver configuration
   * @param requiredConfirmation number of bridges that are needed to make a bridged message valid from origin chain
   * @param validityTimestamp all messages originated but not finally confirmed before this timestamp per origin chain, are invalid
   */
  struct ReceiverConfiguration {
    uint8 requiredConfirmation;
    uint120 validityTimestamp;
  }

  /**
   * @notice object with full information of the receiver configuration for a chain
   * @param configuration object containing the specifications of the receiver for a chain
   * @param allowedBridgeAdapters stores if a bridge adapter is allowed for a chain
   */
  struct ReceiverConfigurationFull {
    ReceiverConfiguration configuration;
    EnumerableSet.AddressSet allowedBridgeAdapters;
  }

  /**
   * @notice object that stores the internal information of the transaction
   * @param confirmations number of times that this transaction has been bridged
   * @param firstBridgedAt timestamp in seconds indicating the first time a transaction was received
   */
  struct TransactionStateWithoutAdapters {
    uint8 confirmations;
    uint120 firstBridgedAt;
  }
  /**
   * @notice object that stores the internal information of the transaction with bridge adapters state
   * @param confirmations number of times that this transactions has been bridged
   * @param firstBridgedAt timestamp in seconds indicating the first time a transaction was received
   * @param bridgedByAdapter list of bridge adapters that have bridged the message
   */
  struct TransactionState {
    uint8 confirmations;
    uint120 firstBridgedAt;
    mapping(address => bool) bridgedByAdapter;
  }

  /**
   * @notice object with the current state of an envelope
   * @param confirmed boolean indicating if the bridged message has been confirmed by the infrastructure
   * @param delivered boolean indicating if the bridged message has been delivered to the destination
   */
  enum EnvelopeState {
    None,
    Confirmed,
    Delivered
  }

  /**
   * @notice emitted when a transaction has been received successfully
   * @param transactionId id of the transaction
   * @param envelopeId id of the envelope
   * @param originChainId id of the chain where the envelope originated
   * @param transaction the Transaction type data
   * @param bridgeAdapter address of the bridge adapter who received the message (deployed on current network)
   * @param confirmations number of current confirmations for this message
   */
  event TransactionReceived(
    bytes32 transactionId,
    bytes32 indexed envelopeId,
    uint256 indexed originChainId,
    Transaction transaction,
    address indexed bridgeAdapter,
    uint8 confirmations
  );

  /**
   * @notice emitted when an envelope has been delivery attempted
   * @param envelopeId id of the envelope
   * @param envelope the Envelope type data
   * @param isDelivered flag indicating if the message has been delivered successfully
   */
  event EnvelopeDeliveryAttempted(bytes32 envelopeId, Envelope envelope, bool isDelivered);

  /**
   * @notice emitted when a bridge adapter gets updated (allowed or disallowed)
   * @param bridgeAdapter address of the updated bridge adapter
   * @param allowed boolean indicating if the bridge adapter has been allowed or disallowed
   * @param chainId id of the chain updated
   */
  event ReceiverBridgeAdaptersUpdated(
    address indexed bridgeAdapter,
    bool indexed allowed,
    uint256 indexed chainId
  );

  /**
   * @notice emitted when number of confirmations needed to validate a message changes
   * @param newConfirmations number of new confirmations needed for a message to be valid
   * @param chainId id of the chain updated
   */
  event ConfirmationsUpdated(uint8 newConfirmations, uint256 indexed chainId);

  /**
   * @notice emitted when a new timestamp for invalidations gets set
   * @param invalidTimestamp timestamp to invalidate previous messages
   * @param chainId id of the chain updated
   */
  event NewInvalidation(uint256 invalidTimestamp, uint256 indexed chainId);

  /**
   * @notice method to get the current allowed receiver bridge adapters for a chain
   * @param chainId id of the chain to get the allowed bridge adapter list
   * @return the list of allowed bridge adapters
   */
  function getReceiverBridgeAdaptersByChain(
    uint256 chainId
  ) external view returns (address[] memory);

  /**
   * @notice method to get the current supported chains (at least one allowed bridge adapter)
   * @return list of supported chains
   */
  function getSupportedChains() external view returns (uint256[] memory);

  /**
   * @notice method to get the current configuration of a chain
   * @param chainId id of the chain to get the configuration from
   * @return the specified chain configuration object
   */
  function getConfigurationByChain(
    uint256 chainId
  ) external view returns (ReceiverConfiguration memory);

  /**
   * @notice method to get if a bridge adapter is allowed
   * @param bridgeAdapter address of the bridge adapter to check
   * @param chainId id of the chain to check
   * @return boolean indicating if bridge adapter is allowed
   */
  function isReceiverBridgeAdapterAllowed(
    address bridgeAdapter,
    uint256 chainId
  ) external view returns (bool);

  /**
   * @notice  method to get the current state of a transaction
   * @param transactionId the id of transaction
   * @return number of confirmations of internal message identified by the transactionId and the updated timestamp
   */
  function getTransactionState(
    bytes32 transactionId
  ) external view returns (TransactionStateWithoutAdapters memory);

  /**
   * @notice  method to get the internal transaction information
   * @param transaction Transaction type data
   * @return number of confirmations of internal message identified by internalId and the updated timestamp
   */
  function getTransactionState(
    Transaction memory transaction
  ) external view returns (TransactionStateWithoutAdapters memory);

  /**
   * @notice method to get the internal state of an envelope
   * @param envelope the Envelope type data
   * @return the envelope current state, containing if it has been confirmed and delivered
   */
  function getEnvelopeState(Envelope memory envelope) external view returns (EnvelopeState);

  /**
   * @notice method to get the internal state of an envelope
   * @param envelopeId id of the envelope
   * @return the envelope current state, containing if it has been confirmed and delivered
   */
  function getEnvelopeState(bytes32 envelopeId) external view returns (EnvelopeState);

  /**
   * @notice method to get if transaction has been received by bridge adapter
   * @param transactionId id of the transaction as stored internally
   * @param bridgeAdapter address of the bridge adapter to check if it has bridged the message
   * @return boolean indicating if the message has been received
   */
  function isTransactionReceivedByAdapter(
    bytes32 transactionId,
    address bridgeAdapter
  ) external view returns (bool);

  /**
   * @notice method to set a new timestamp from where the messages will be valid.
   * @param newValidityTimestamp array of objects containing the chain and timestamp where all the previous unconfirmed
            messages must be invalidated.
   */
  function updateMessagesValidityTimestamp(
    ValidityTimestampInput[] memory newValidityTimestamp
  ) external;

  /**
   * @notice method to update the number of confirmations necessary for the messages to be accepted as valid
   * @param newConfirmations array of objects with the chainId and the new number of needed confirmations
   */
  function updateConfirmations(ConfirmationInput[] memory newConfirmations) external;

  /**
   * @notice method that receives a bridged transaction and tries to deliver the contents to destination if possible
   * @param encodedTransaction bytes containing the bridged information
   * @param originChainId id of the chain where the transaction originated
   */
  function receiveCrossChainMessage(
    bytes memory encodedTransaction,
    uint256 originChainId
  ) external;

  /**
   * @notice method to deliver an envelope to its destination
   * @param envelope the Envelope typed data
   * @dev to deliver an envelope, it needs to have been previously confirmed and not delivered
   */
  function deliverEnvelope(Envelope memory envelope) external;

  /**
   * @notice method to add bridge adapters to the allowed list
   * @param bridgeAdaptersInput array of objects with the new bridge adapters and supported chains
   */
  function allowReceiverBridgeAdapters(
    ReceiverBridgeAdapterConfigInput[] memory bridgeAdaptersInput
  ) external;

  /**
   * @notice method to remove bridge adapters from the allowed list
   * @param bridgeAdaptersInput array of objects with the bridge adapters and supported chains to disallow
   */
  function disallowReceiverBridgeAdapters(
    ReceiverBridgeAdapterConfigInput[] memory bridgeAdaptersInput
  ) external;
}

interface ICrossChainForwarder {
  /**
   * @notice object storing the connected pair of bridge adapters, on current and destination chain
   * @param destinationBridgeAdapter address of the bridge adapter on the destination chain
   * @param currentChainBridgeAdapter address of the bridge adapter deployed on current network
   */
  struct ChainIdBridgeConfig {
    address destinationBridgeAdapter;
    address currentChainBridgeAdapter;
  }

  /**
   * @notice object with the necessary information to remove bridge adapters
   * @param bridgeAdapter address of the bridge adapter to remove
   * @param chainIds array of chain ids where the bridge adapter connects
   */
  struct BridgeAdapterToDisable {
    address bridgeAdapter;
    uint256[] chainIds;
  }

  /**
   * @notice object storing the pair bridgeAdapter (current deployed chain) destination chain bridge adapter configuration
   * @param currentChainBridgeAdapter address of the bridge adapter deployed on current chain
   * @param destinationBridgeAdapter address of the bridge adapter on the destination chain
   * @param destinationChainId id of the destination chain using our own nomenclature
   */
  struct ForwarderBridgeAdapterConfigInput {
    address currentChainBridgeAdapter;
    address destinationBridgeAdapter;
    uint256 destinationChainId;
  }

  /**
   * @notice emitted when a transaction is successfully forwarded through a bridge adapter
   * @param envelopeId internal id of the envelope
   * @param envelope the Envelope type data
   */
  event EnvelopeRegistered(bytes32 indexed envelopeId, Envelope envelope);

  /**
   * @notice emitted when a transaction forwarding is attempted through a bridge adapter
   * @param transactionId id of the forwarded transaction
   * @param envelopeId internal id of the envelope
   * @param encodedTransaction object intended to be bridged
   * @param destinationChainId id of the destination chain in our notation
   * @param bridgeAdapter address of the bridge adapter that failed (deployed on current network)
   * @param destinationBridgeAdapter address of the connected bridge adapter on destination chain
   * @param adapterSuccessful adapter was able to forward the message
   * @param returnData bytes with error information
   */
  event TransactionForwardingAttempted(
    bytes32 transactionId,
    bytes32 indexed envelopeId,
    bytes encodedTransaction,
    uint256 destinationChainId,
    address indexed bridgeAdapter,
    address destinationBridgeAdapter,
    bool indexed adapterSuccessful,
    bytes returnData
  );

  /**
   * @notice emitted when a bridge adapter has been added to the allowed list
   * @param destinationChainId id of the destination chain in our notation
   * @param bridgeAdapter address of the bridge adapter added (deployed on current network)
   * @param destinationBridgeAdapter address of the connected bridge adapter on destination chain
   * @param allowed boolean indicating if the bridge adapter is allowed or disallowed
   */
  event BridgeAdapterUpdated(
    uint256 indexed destinationChainId,
    address indexed bridgeAdapter,
    address destinationBridgeAdapter,
    bool indexed allowed
  );

  /**
   * @notice emitted when a sender has been updated
   * @param sender address of the updated sender
   * @param isApproved boolean that indicates if the sender has been approved or removed
   */
  event SenderUpdated(address indexed sender, bool indexed isApproved);

  /**
   * @notice method to get the current valid envelope nonce
   * @return the current valid envelope nonce
   */
  function getCurrentEnvelopeNonce() external view returns (uint256);

  /**
   * @notice method to get the current valid transaction nonce
   * @return the current valid transaction nonce
   */
  function getCurrentTransactionNonce() external view returns (uint256);

  /**
   * @notice method to check if a envelope has been previously forwarded.
   * @param envelope the Envelope type data
   * @return boolean indicating if the envelope has been registered
   */
  function isEnvelopeRegistered(Envelope memory envelope) external view returns (bool);

  /**
   * @notice method to check if a envelope has been previously forwarded.
   * @param envelopeId the hashed id of the envelope
   * @return boolean indicating if the envelope has been registered
   */
  function isEnvelopeRegistered(bytes32 envelopeId) external view returns (bool);

  /**
   * @notice method to get if a transaction has been forwarded
   * @param transaction the Transaction type data
   * @return flag indicating if a transaction has been forwarded
   */
  function isTransactionForwarded(Transaction memory transaction) external view returns (bool);

  /**
   * @notice method to get if a transaction has been forwarded
   * @param transactionId hashed id of the transaction
   * @return flag indicating if a transaction has been forwarded
   */
  function isTransactionForwarded(bytes32 transactionId) external view returns (bool);

  /**
   * @notice method called to initiate message forwarding to other networks.
   * @param destinationChainId id of the destination chain where the message needs to be bridged
   * @param destination address where the message is intended for
   * @param gasLimit gas cost on receiving side of the message
   * @param message bytes that need to be bridged
   * @return internal id of the envelope and transaction
   */
  function forwardMessage(
    uint256 destinationChainId,
    address destination,
    uint256 gasLimit,
    bytes memory message
  ) external returns (bytes32, bytes32);

  /**
   * @notice method called to re forward a previously sent envelope.
   * @param envelope the Envelope type data
   * @param gasLimit gas cost on receiving side of the message
   * @return the transaction id that has the retried envelope
   * @dev This method will send an existing Envelope using a new Transaction.
   * @dev This method should be used when the intention is to send the Envelope as if it was a new message. This way on
          the Receiver side it will start from 0 to count for the required confirmations. (usual use case would be for
          when an envelope has been invalidated on Receiver side, and needs to be retried as a new message)
   */
  function retryEnvelope(Envelope memory envelope, uint256 gasLimit) external returns (bytes32);

  /**
   * @notice method to retry forwarding an already forwarded transaction
   * @param encodedTransaction the encoded Transaction data
   * @param gasLimit limit of gas to spend on forwarding per bridge
   * @param bridgeAdaptersToRetry list of bridge adapters to be used for the transaction forwarding retry
   * @dev This method will send an existing Transaction with its Envelope to the specified adapters.
   * @dev Should be used when some of the bridges on the initial forwarding did not work (out of gas),
          and we want the Transaction with Envelope to still account for the required confirmations on the Receiver side
   */
  function retryTransaction(
    bytes memory encodedTransaction,
    uint256 gasLimit,
    address[] memory bridgeAdaptersToRetry
  ) external;

  /**
   * @notice method to enable bridge adapters
   * @param bridgeAdapters array of new bridge adapter configurations
   */
  function enableBridgeAdapters(ForwarderBridgeAdapterConfigInput[] memory bridgeAdapters) external;

  /**
   * @notice method to disable bridge adapters
   * @param bridgeAdapters array of bridge adapter addresses to disable
   */
  function disableBridgeAdapters(BridgeAdapterToDisable[] memory bridgeAdapters) external;

  /**
   * @notice method to remove sender addresses
   * @param senders list of addresses to remove
   */
  function removeSenders(address[] memory senders) external;

  /**
   * @notice method to approve new sender addresses
   * @param senders list of addresses to approve
   */
  function approveSenders(address[] memory senders) external;

  /**
   * @notice method to get all the forwarder bridge adapters of a chain
   * @param chainId id of the chain we want to get the adapters from
   * @return an array of chain configurations where the bridge adapter can communicate
   */
  function getForwarderBridgeAdaptersByChain(
    uint256 chainId
  ) external view returns (ChainIdBridgeConfig[] memory);

  /**
   * @notice method to get if a sender is approved
   * @param sender address that we want to check if approved
   * @return boolean indicating if the address has been approved as sender
   */
  function isSenderApproved(address sender) external view returns (bool);
}

/**
 * @title IBaseCrossChainController
 * @author BGD Labs
 * @notice interface containing the objects, events and methods definitions of the CrossChainController contract
 */
interface ICrossChainController is IRescuable, ICrossChainForwarder, ICrossChainReceiver {

}
