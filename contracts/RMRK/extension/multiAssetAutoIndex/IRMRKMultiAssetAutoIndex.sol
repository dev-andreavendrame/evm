// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.16;

import "../../multiasset/IRMRKMultiAsset.sol";

interface IRMRKMultiAssetAutoIndex is IRMRKMultiAsset {
    /**
     * @notice Accepts an asset at from the pending array of given token.
     * @dev Migrates the asset from the token's pending asset array to the token's active asset array.
     * @dev Active assets cannot be removed by anyone, but can be replaced by a new asset.
     * @dev Requirements:
     *
     *  - The caller must own the token or be approved to manage the token's assets
     *  - `tokenId` must exist.
     *  - `index` must be in range of the length of the pending asset array.
     * @dev Emits an {AssetAccepted} event.
     * @param tokenId ID of the token for which to accept the pending asset
     * @param assetId Id of the asset expected to be in the index
     */
    function acceptAsset(uint256 tokenId, uint64 assetId) external;

    /**
     * @notice Rejects an asset from the pending array of given token.
     * @dev Removes the asset from the token's pending asset array.
     * @dev Requirements:
     *
     *  - The caller must own the token or be approved to manage the token's assets
     *  - `tokenId` must exist.
     *  - `index` must be in range of the length of the pending asset array.
     * @dev Emits a {AssetRejected} event.
     * @param tokenId ID of the token that the asset is being rejected from
     * @param assetId Id of the asset expected to be in the index
     */
    function rejectAsset(uint256 tokenId, uint64 assetId) external;
}
