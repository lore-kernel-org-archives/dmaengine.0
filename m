Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012038.outbound.protection.outlook.com [40.107.200.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4738C42B;
	Sun, 23 Aug 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787483601; cv=fail; b=vE+t7h4TeAM0kMo3ehuNEsELHL4uKFnNQ8hjVEzxp2hMrJ8xWfTWcPaT4bRIvyqk7zVNPUJcBM+vyFG3zy66k86HRI3s7IPZREnakCO5NdJWsLK+IE9QPicg01p1GpwxKBa0w/ch7Cy82cgMEAxHLglaoRgoawfiQVxyG0jmWUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787483601; c=relaxed/simple;
	bh=yzCat7optaBoODCQZ2R9cCF2/L4VNmMUf7xxEs87c80=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fqe89xFmxdpho7ALvUiTvRM35CcwjEOmVZXPkiORTEw55nhjowsuFwi9xFyYGSx/CfquTxjK/NmhrMpFwRRNjSaW6m0tESO5XM4xVYOKwQlfJdSirS57f3jRpquoCYhWJplSdErq7r+nYuZuYuR4LYdowuZxvwdX6FB7yKbkW2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WkN9p9qj; arc=fail smtp.client-ip=40.107.200.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WkN9p9qj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SthmSv0Rl5QM6pjIWMPev5hPPFlwUS9Vs5JyH3SE+JHophxlToYz7yyx9DQ6agFdNWMM82VBK2NK7fS0/vSH+lK+iPHvc+otJ2pMDRzdnLmCO4QAxx2AF2+kKSSzuw2hccjvuGMsbs23IgX1PR3yzjYIeRKL+eosUi5JIopqIopAQzMPqDGZnWAROxWVatzAamHyJgdndER8NNWPiU/gN8rFT/nXN5hpYyPkWoww9Ii1PS1ggS72MVkSkJ6x8mX0aAFN0tt4RA4MOIDgTPiE8of+Rv5yrK/ubgETo4dvSztgRwm0vIGN4wXNRmnUEuBX4Z/li4u2zP8elG0gLPe2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hw+xiU42mbZ6nC7z7HVMfX85BgnikTlnbwTgtE5h8IU=;
 b=Mr4J2pyMKwLe8X00BuXHUdvfrTtvue2tQLwcvzUrU8YhXGn6SM4lsOf1YxK16mhJZNTDVvZm+0Zxn0EsNpFLr6+8j+Yltf8p2N0JmxlVri/jAAGKcx/j4Hl30dyF/MpGMM0TX8Z//UNJeJzUQl/+vVKKYzd2pc5xV34BbvZqv8n/LOumC0sS7t7HCCQKqN6VPqBzzMoAAZOKzFCj4v1i7dDEkbzmCYIXUB+3jPmux19H7Rqec9J/v3weP2A9dax+F9WMqLayi+dhGxSDfqgLSbYQJGVzu64C7PN0B7KXuyCX3AIDyocv4MVNcP2dL7ub8+QK8CB9lDBlqgNEsyNU5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hw+xiU42mbZ6nC7z7HVMfX85BgnikTlnbwTgtE5h8IU=;
 b=WkN9p9qjAnIk7FAZ6SNitU2rSISvEklqEXgzR+1CLXDuB5iU2mphcoKJ4hocAu2ednr2pM4Ug68uNOZEbqATBneYcL2ey1hmJFIiBKyoc/6CcxTGeBKx0bjNTf6rhZh6WElU6IRZ2Msxp8MJdyafVasZSi8qZBwxS2t/4YJLaXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 11:13:16 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%2]) with mapi id 15.21.0315.011; Sun, 23 Aug 2026
 11:13:16 +0000
Message-ID: <a59b49bb-74cb-4855-88d9-dfe5870135f4@amd.com>
Date: Sun, 23 Aug 2026 16:43:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 chain after cyclic DMA
To: Alex Bereza <alex@bereza.email>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260818-fix-hw-buf-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <20260818-fix-hw-buf-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0103.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2bb::10) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|LV2PR12MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b82c694-7585-466f-03c2-08df010787b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|18002099003|11063799006|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	D0By1hLwk8o61H43hEGkfDxOn3I8ntlOfnsnE1b7qBEaUioRZRAjRPuD6E5l5Q7NZf5qiNi3dZ4KIKmoeQU4rCnVIYP+EVspnvpYOvCbxfB5Jx7m1N/gd68VT0PNGhZ2Mjdis9tmhKh9ui7Y5fV4HIUrCOfR2e9xiEc+zSyw2LWw/LD/r8DghMOLGF+cVeL4Lq0xR9SJOZreDVfAsyUd0WohZGeFDVT2msaTvu/77ShKfg6xrUQNUFfwlznY7cS3u7+46LzWH4AtfZvCvP3ouqVxLnBCfF/+9hPKaOpnm2s2cBw2W6U+ekGeMWiIDiXy6rXw+3gcFr4nSkRdLq3xmoMjBTVxks66cu8aGZW7v/+agay37UN7Q6Ns09DkLIgxEPZxyN4rEW4/q65C9WRNcwVUHdFMtB5qCNKSKVUhdziKOyLcC+QEA7KEMU3hNbYDc+l7sKxNjonuiA0cdBWk9zruDd94E/asKXOEY+qikbBk1KDNwxMnH6sWJ6CVjt5HihYVk4N75fapQJFhzHHCDuLU6BQ76zQMmro9Y/oxCW42zC9f5cJVTPNoOeksmdIq9jtnDSr5gz1MmPlV/mg4e7ECfmwnhdSP/daeMOGytqgiOnAus387VuRc00kM1Sd4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(18002099003)(11063799006)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmh6Sk9HbFg2ZjlCa0oxWFdkdGFOY2RwZnVhV1gxSFZRK1hKb0JoYk1jTVhs?=
 =?utf-8?B?UUw3aWNuVWJtbHpwNklXL1o1Y1FGTUUyM0x6cmtJWjVqMWY5SE5IOW45R0Ex?=
 =?utf-8?B?MTBsZk4ydlpBUFNGV01tWG92NDZoTDV6Mi9GNEFiWm5nSGZRRG0vZ0NzVjk5?=
 =?utf-8?B?UzU2NnZEdzB1RC94cnBTK05ZS0hLUmIzSDVVcndpK2xIOFFQVzNCc2Q4SUtu?=
 =?utf-8?B?RW5rNWlBbU1UclUvejBwT1pCYzIyVGNJWldKeE1KNzRoQTlHRHBxckJ4RG9n?=
 =?utf-8?B?eWhxZmJ0TkYxaU9BRG1SY0V5M1F3cVNicnQvMDFXK1JzZzJ4ZitQVWdNeUtw?=
 =?utf-8?B?L3VBZTBHUnY3cmhiaDlNY2w0NXp2dHJiYzIvcWhhUTdhNTdDZFVlSkw3RS9p?=
 =?utf-8?B?SFo3VkFDV1lVamQycWl0YnErMG1VY2FVUlhSS1FkMzFuZ1N3K0FzTHJiR01i?=
 =?utf-8?B?TkdkaEQ3dFp3RCtIYmF5UDBBai9Uam5jaUVDSW16UDF5WmNFKzhjbFFSdUpv?=
 =?utf-8?B?QnJoZFVua2FmcEhRTW1Hd2taOS91YmRFVy9zbHBETlY0Yy8vTWVaaFo5Qm1P?=
 =?utf-8?B?WklHdmpVM3M4MGMyZ1ZqVTIvdENHSWZlVkpTV05tYnVUem9TQjF0L2IrRTB3?=
 =?utf-8?B?Ri81ZW55Sk14SWprTVhSRU94N0ZUa3JEbkhuTG4vL2F3WlprWGhFbks0OGVt?=
 =?utf-8?B?R2daL2MvaEZLV2VESUFpc1o5Umk0ZTR3ankxaE5QTW5CMEQxUzgrOS9hRVZk?=
 =?utf-8?B?U083d0VYM2UyUHBzbUJkcm1BZU1jMGcxVFc1OVcvUExRcS9qbDFiaXdYS1lU?=
 =?utf-8?B?d2hKQWQ4Y3N5RTZ0N0RtNU5PL3VSMTNiK05VYytOOFNRTVhUd0VvRjV4K2du?=
 =?utf-8?B?ajlHeS9ZT0dYQzhJcnMvekYwYUNRNFdmeXYweW1CSGlFNDhPSVkvdlVYaVEv?=
 =?utf-8?B?VnloU28vODROdHlVZ1Y5V0lVWGJybCtISDEwRFhBQTI5YjlORUlwQ21SREI0?=
 =?utf-8?B?QTVrR2VUQUVWKzN3TWZaVlRlZjVEazBtTENlanp1QXhMTDR6V2tMNkhKU1Zk?=
 =?utf-8?B?WTVtMDBqWVRVM3FQeXFCSkp6MFFMamd5eVBmQlpxVi92MWpTcng3eWRPNERn?=
 =?utf-8?B?Uzdmd2tjc3Q3L2RLNEZISTdvR1MyOGxEMVh4Y1NOdDFjdkZaSGExZmtIejN5?=
 =?utf-8?B?Zm84MFdHSVZuZnd4VlN6d3p3V3pJMTdDSXpxdyswUyt5QmY5eWV2S1E0WHJO?=
 =?utf-8?B?M1NqOTdaWk04KzFNQmRrT29pM1ZWdXVxVkRIS3VJYzU4UVhJN2JkU20xeEdB?=
 =?utf-8?B?MStlcjBNVkRrdjB3R2s1NmYyMVdhUFJIUVpSSXZ1bDdWS292UkFod0lsNnZ5?=
 =?utf-8?B?YzNHYnhIWUlTVDlrRHRLUGJwaWJqbVFWT2d2OWFSZ0luVFdBMFNraWNIWWcw?=
 =?utf-8?B?RXRGS09kTHk5NHNmbjJJRU9Pajl3WDFrb0RyOHRmVlo0TVIzVElEYlMwT1ZD?=
 =?utf-8?B?VWpJeXBMR3VQd2VkcEVJcEI0Y0RKWWQzbUNqeHlDVE5FbEF1Wk1rT3NCb2Vr?=
 =?utf-8?B?MWNmOXRrbFB3R09ZR1pOc0RYaXVOYVdhT09qbE4yZDVwTEd2c0RBOXNTWFBF?=
 =?utf-8?B?a1NwdnkxUXU3R2dEemVHRWNvVVcvZHV3b0kwMUZibVE2REZ4a0NRWVNoTjRC?=
 =?utf-8?B?aVBtcnkwazNxWUN2NUFPbWkxSVBhYldZUGFSV2ZwS2F4SkZDWTVOaEp6ajZL?=
 =?utf-8?B?QlkrelU0bUJwQWQ4bG1vWldoRjNZSWl1TlRHNnlBa0Zxdi9kVjJBb3l0d1lH?=
 =?utf-8?B?Q2VxOVk1RGx4MllaSGRnZmVOdFJDcHlkc2hBVkVqeVRNdklCakhJSW9DSXNo?=
 =?utf-8?B?VERLZEpvYTJFSVI0RFN4R0RmS252bkgwTTVnUkZONDEweGpkZHRDOWZJOUk0?=
 =?utf-8?B?aERlcURhN2pqMUhOdWVrTlNEQUlWYnkwdU5nWW50QXQ2NFBGNXBiRlBvb0pM?=
 =?utf-8?B?UjhtbXl3OXB2K3AxZVA0cnEvYWg4b3hPTVd6Sm5zWFdVeWZLMzhQRTlScDds?=
 =?utf-8?B?cE1mdCs1aHpLOXBDS1lyendYVnZIRG5ldVBGUktwV1c2TTA0SDduVFVUa245?=
 =?utf-8?B?L2UyYS9EcUU3YkkwRUVNRHlmTWY4VUdFV2lIMVVCSm8wZ3dBZ0hWMnhYTGNm?=
 =?utf-8?B?dnpZTm5OakZPbVRsUHBtYjVzMUVHL29LcjNuZ1NSRlVJR2t0ampLSUEvLzdU?=
 =?utf-8?B?d2s4N0Fra1lidjdRbXlpb3UrZVc0bkI5VTRRMUxhWWhUcHRCc043M0lqQ2VH?=
 =?utf-8?B?bEJSTFhOU1B5Z29aNWtiOEp4T0NMT3oxcUxEZUhnQ0FqcWhUeklLQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b82c694-7585-466f-03c2-08df010787b5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 11:13:16.4126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vxr5md0IHgzsxXSkplDYo1f7TkpGInXmbEazaqO1YIwdWdpdV5Yk+0fxMaWQXrj/HCu+DZkTVUwDd1iCxzqEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6014



On 8/18/2026 1:06 PM, Alex Bereza wrote:
> Using the DMA in cyclic mode modifies the hardware buffer descriptor
> chain in xilinx_dma_prep_dma_cyclic so that the last descriptor used by
> the cyclic transfer points back to the first descriptor, but it never
> restores the original descriptor ring. This breaks using non-cyclic mode
> after cyclic mode with an error like:
> 
>    xilinx-vdma 86000000.dma: Channel 00000000354d5c8d has errors 100, cdr 6de40000 tdr 6de40400
> 
> The only way to get out of this error state is to rebuild the hardware
> buffer descriptor ring by releasing and re-acquiring the channel.
> 
> Fix using non-cyclic mode after cyclic mode by always restoring the
> original buffer descriptor ring in the same manner as it is set up by
> xilinx_dma_alloc_chan_resources().
> 
> Fixes: 23059408b6a3 ("dmaengine: xilinx_dma: Fix race condition in the driver for multiple descriptor scenario")
> Signed-off-by: Alex Bereza <alex@bereza.email>

Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>

Thanks,
Suraj

> ---
> Changes in v2:
> - Use pointer arithmetic instead of potential 64 bit division in
>    xilinx_dma_clean_hw_desc() as suggested by Frank Li
>    <Frank.Li@kernel.org> and sashiko-bot - Thanks!
> - Link to v1: https://patch.msgid.link/20260817-fix-hw-buf-desc-after-cyclic-mode-v1-1-1fe47e701d6c@bereza.email
> 
> To: Vinod Koul <vkoul@kernel.org>
> To: Frank Li <Frank.Li@kernel.org>
> To: Michal Simek <michal.simek@amd.com>
> To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   drivers/dma/xilinx/xilinx_dma.c | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index bef2b031dba1..650e078fcdb7 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -756,15 +756,25 @@ xilinx_aximcdma_alloc_tx_segment(struct xilinx_dma_chan *chan)
>   	return segment;
>   }
>   
> -static void xilinx_dma_clean_hw_desc(struct xilinx_axidma_desc_hw *hw)
> +static void xilinx_dma_clean_hw_desc(struct xilinx_dma_chan *chan,
> +				     struct xilinx_axidma_tx_segment *segment)
>   {
> -	u32 next_desc = hw->next_desc;
> -	u32 next_desc_msb = hw->next_desc_msb;
> +	dma_addr_t next;
> +	u32 i;
>   
> -	memset(hw, 0, sizeof(struct xilinx_axidma_desc_hw));
> +	/*
> +	 * Restore the buffer descriptor's next descriptor pointer to the value
> +	 * set up in xilinx_dma_alloc_chan_resources(). Otherwise using the DMA
> +	 * in cyclic mode leaves the next descriptor pointer altered and
> +	 * prevents subsequent non-cyclic transfers.
> +	 */
> +	i = segment - chan->seg_v;
> +	next = chan->seg_p +
> +	       sizeof(*chan->seg_v) * ((i + 1) % XILINX_DMA_NUM_DESCS);
>   
> -	hw->next_desc = next_desc;
> -	hw->next_desc_msb = next_desc_msb;
> +	memset(&segment->hw, 0, sizeof(segment->hw));
> +	segment->hw.next_desc = lower_32_bits(next);
> +	segment->hw.next_desc_msb = upper_32_bits(next);
>   }
>   
>   static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *hw)
> @@ -786,7 +796,7 @@ static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *hw)
>   static void xilinx_dma_free_tx_segment(struct xilinx_dma_chan *chan,
>   				struct xilinx_axidma_tx_segment *segment)
>   {
> -	xilinx_dma_clean_hw_desc(&segment->hw);
> +	xilinx_dma_clean_hw_desc(chan, segment);
>   
>   	list_add_tail(&segment->node, &chan->free_seg_list);
>   }
> 
> ---
> base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
> change-id: 20260817-fix-hw-buf-desc-after-cyclic-mode-cf0a7834ab50
> 
> Best regards,
> --
> Alex Bereza <alex@bereza.email>

