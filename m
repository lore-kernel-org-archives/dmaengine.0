Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010041.outbound.protection.outlook.com [52.101.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDB8347BD7
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 05:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787203570; cv=fail; b=DQxcNvdlTgwHvb1YUXbK03ZqNS71lHKERAbIFoBty2CajNkI3MWD7ciH5XKFaIJsOgSEq9QMeZ8jjae9cynt3GA/qP7oIDeziPfQCENa/xVG3Xrs7kKXTjQc4wM+gXw7oe98Udk5VpVhG6VTHuWSdOUSoPXSIG/BboYQCJm5hCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787203570; c=relaxed/simple;
	bh=s2SoDyGNc85jlpMx3mSCDDp1NlEx0jDonS2V+mCpd2I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AIblAzOzx4Vlm/y/nHPMnA7YL4xQ5+FeikyYXSfapGNc7ZdT0hfwaUZn4GoaYZ1wurqaB6LZRyB9GgNZbMdmIoCCoYXdTBwWuhCPLyz/eBhuqANX65t8NOKbKbfxhxBn9vUEYevkpFfoEf3mlFafL2pfcklc5fmJy9zk7sN0ojQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wJIjCvas; arc=fail smtp.client-ip=52.101.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wJIjCvas"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKNAuphsjkp7nKYJP+FHOOvAbrPJpAXN1w4POwI1dyxkymh94oqfR0PF0fG3J1B76DRkF7B5G6s3/QYOzQK12Wy9615Ch+mXLLGpt7/MKUZn5fOMHHQTbX6ee1T/KkT4gnBZ1KrpPDOwvJH3Z2Z8SwUc/Jy4Tgcs/GnEEMenCYVcCI0qfkh5YxODW8uNrnhUrhVuwY1BPoQ+cLSxue3cBDMeiGSk/QWU7hRyvrYbcY7CLgdliTQpVDR6VAqXKCfL+GMjBYo4imgEztVL8fyS0J9mEon9ObrkU9IHpKazewrR4lUB/VoUqtctSV8w6OKUd6JQuv/34rETBQnUwRFm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfyTrDXuHPVwgbS1P5Bfmje1ZrWf+vwDfskA3ookWto=;
 b=etgyX2MKDmL4PVcnA/U3YwomVdmqWXKTfq9BGA+uOvOQEATtDu+v57lnaM3/w/ScNb/UbDpc9iN9Qja3TniWjtAxVelBaQItBlP1l5zESmDgk4LlEibkJtxzhFYi3RrPPzXOuk/5xJEsVD4pHpV2HbSmO6J3MJtP85H/T6SVazHVirTAcRLl7vOQuBS1EgmxdhIivYGpWev8oer9QOH3xj4vrjt7ELs5gfqDG9MbHMffSnfcO6T7bKyrtYS+z+te+J61FYcRzTd817t/3ys8a7pPx1lb4x9mseLlglVpyqEqRj51JmAvkTuKL/vXRQy2PejTbhKG1tKhruO1oqARwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfyTrDXuHPVwgbS1P5Bfmje1ZrWf+vwDfskA3ookWto=;
 b=wJIjCvas9GOi1MfGW/JDnQXdU2fOswIo9WwS4LzNUV+lXl9MpQSmoD9oib0y2XWkgBUqpw6W4vALwgB9InimDvPzXDexmbFgRvb/C1CXmdFZ8L1eN+FilL6JkFQer/o7PakodBkWN6/piSOkJIjku+Z0fkgTr3/Tqt7tm0XoUz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 by PH7PR12MB7210.namprd12.prod.outlook.com (2603:10b6:510:205::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 20 Aug
 2026 05:26:06 +0000
Received: from SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2]) by SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 05:26:06 +0000
Message-ID: <81ee9b20-1687-4110-98fc-0a05bd5180d2@amd.com>
Date: Thu, 20 Aug 2026 10:56:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 3/4] net: xilinx: axienet: Derive RX frame length from
 residue in dmaengine path
To: sashiko-reviews@lists.linux.dev, Srinivas Neeli <srinivas.neeli@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
References: <20260818174151.1608971-1-srinivas.neeli@amd.com>
 <20260818174151.1608971-4-srinivas.neeli@amd.com>
 <20260819174717.D90571F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Neeli, Srinivas" <srneeli@amd.com>
In-Reply-To: <20260819174717.D90571F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::8) To SN7PR12MB8147.namprd12.prod.outlook.com
 (2603:10b6:806:32e::5)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8147:EE_|PH7PR12MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc9fd7d-305c-422b-75ea-08defe7b88b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|6133799003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	4avz5PAoz7Y4+W/J8WPj0Zqvz3Wo0/3Jr/4CsfZ3tVbNgfuAcC8tWD2BUOxT17/MQDRURxvssL3lW+dX5QBZh0XvJ2dG/bEDBF9vMDjC4v8iGNi1G5znbX+wREmJF+YSMPfOel4x2I/kRf8qpMjQ4gT44dqnLrYfGhg4DrPSSyO2rHX9rhMV0gNmEAoreLNnwbeACP5aeA2JSqXl7KEqrnDgX/8Zx6nV630R9eOyWmYHx989NfsS+FXSbOE9lPK9Ax6xptouR9yOXB/mqeedXSxUhCcw3Y85lk/oYHWEqkc8LWQVL3r87QbHotushLHeCq6/IO7NZFC5+n7EKltCR9iThq+Dk39OA58GEdkJK1J+ATsC/qJygNZXidOwN6fylJpei7e5iPNIyRAmTyinegiTIOJDV9YC79aXqeaUtWAOUlg5yX0QbBfQ2q2OE82p5g5d9aM5x+EpqandUbqpOPwmpl8SQScnSsd6J/NjiGNC5Bwm9ZQprgj86DlP94mGAXM20PN1Cg6dPrgxNwhMZ/D6fn9jaQdMmjVV6FI4JyEvkY9BCir39QzgVDVWetgJ6zVRtJ0n4HQibT1nogUseVnEvcR5qwzhyIjfJBCABxtdFYBxSZe1n5CPpu9N72DM9FIrpxhkrN/0kcpWU/tCsJvZAtEf1IxjEZZkmnmXtzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk4vQ3J3TzJTVGVRWWVXRU0xdk1tL3FmRFRWc1VxeEd6dkRmUDcyMFpiR0Z4?=
 =?utf-8?B?b1crV1BXT0JleHVVaytCRGZ3V1VSUUloRlNPYWJ2YkRSK1BMaFI5N3phZFNw?=
 =?utf-8?B?bUpVSHM3MVNhVE1jdm4yYkJVN2RzVTBCMzkxT2cxa3dEa0VqSk9yNFVvQnR0?=
 =?utf-8?B?OVE2dHBNNHJFNmw1NSttM01mR1RZUEdOS2pQeXFERGRpM2J3bk1mTTdqOTcy?=
 =?utf-8?B?VTYwbVowRkdLT2NDZldwa1FuNUFIaU5sZklaZzhUdHRXKzdZc0RwRjBaS1Bk?=
 =?utf-8?B?Wk0zR3NlTnJ4N0Iyb1pxT3Z6RUE2S0lKREtzT3YwWk0zNDNPMHNZNjFmSFFl?=
 =?utf-8?B?WXl5UGRuYkJSNC9MWkk1eXBSMThqNDArMTdyTXZuZFJRY3NjZUZ0VVhrYzZL?=
 =?utf-8?B?VGc2anVvN0lXaVZDSW1pUVF3SERHcDBSUGtuWms4bTI5YzNsWTkxdUxDTVFy?=
 =?utf-8?B?SlhCSjE4S3VqZlhacUZvQzZFaHI0YjNwWFJ4Q3JHVXI2QzlJWFNPTWIrU3hq?=
 =?utf-8?B?MEQrSUhCR1lWZXpzeUswT2V1MmZDTjg1MXlyNlpvbTRMZ1hBTk5NeERaTzJu?=
 =?utf-8?B?ekltUHhQZDNhR21pbVlZLzNEWTdvYzlJR0kxTG1Ec04rOFQ2a2d1QldoWnhZ?=
 =?utf-8?B?Q2lTZlhGOFhISkxtYTVjcUhIS2o0STV6aWNwZHUyNldmQWVOTTFEZGFQTTdy?=
 =?utf-8?B?bm5QM1JSdGNETUU0RjBKY1hpaHBaTkViY2xxV3J5aHhpU3B4MVhBZnpBVTk5?=
 =?utf-8?B?UE1VM1ExMk9Xc0UweTNtYVZmMVUwcEpyaWEwN0lwcC9BcnNzdEZoTGd0cmNT?=
 =?utf-8?B?WmlNNlM2WjBjU1JZa1FxdmJkY3FZeGhCOTREQVRuajdPUDFsRmdlOS91eWhM?=
 =?utf-8?B?Y29KZUVFWXFrZ0pNMFo2QjNlOVByYVBNYndQcXE4Zm8rbXVPSDErdHVqVGV2?=
 =?utf-8?B?RENIUkp4bmR6Y3B3QnlvTVNsRm9oWUJYVHdOMzhKc3ZlZEd0QlVuNnpIT0FR?=
 =?utf-8?B?ckxWUzcvYUJ2ZVNmaUp2UzhWMHRHak5Jb1NqaWxyY3NCT3ZkZ1V4N3IwODhZ?=
 =?utf-8?B?NlMzeXFJWVBwUENHaTFMdU5aY0Zmek5GV1phMGkzVUc5WkpOMEw4RVpWOFYz?=
 =?utf-8?B?SzJhZWl6bllaUmFTYXMyMGlYNlg4WUVyWTRCQlpkVmFDVXhIQ3p5b3ZSN0NT?=
 =?utf-8?B?L0VRVEVidkVya3VZVG9Ka1d0bTFtM0RZU1dXelJPNGpGWUFua3JvdVB1UzJo?=
 =?utf-8?B?dDR6aDFWNGRzdHh5alRLOE5PUWhrWkJjLzdsN25Gdm9SR3hFeXBKendtK21t?=
 =?utf-8?B?MDc2VWZoV3ArdkVZTmZudk5wR20vcHZFbjlqckF5bXBHNDZSaFZzaVJPeEc3?=
 =?utf-8?B?OGx4a2Q3bVZnZVJPVVkrU0xiTG9Fa3NWUzlNK2VCMjV2d1FHMTI0M3d5Yzh5?=
 =?utf-8?B?ZFlobkZiVU9MTXBkK1ZiZ1pCSVZoUkkvNjlwL0xKLzFDZUs1RnR6eHd1Q3Nt?=
 =?utf-8?B?Ti9lb2VvTXpsNTVFa0lzOVV4QVE3TUFrdUxRTlJQZ0tyTWlRV3lCbWRvS2M0?=
 =?utf-8?B?bFRWdHNIelltMmt2azVtVUJRZDVqUGg2ZU9wOVVoeUpXUVp3Y1dQdDloN1Vq?=
 =?utf-8?B?Y3J6VG1IL3M0RVg0b3B0NFZDcHV3Y2JTaXdoQ0xJL2VJZzExTnFPamwxMFJU?=
 =?utf-8?B?dFU3WTdYQXp5VFVWRE5xQ1hqWW9QUmVPS0RGbCtxNmdJK3ZxQkhOa2xEL3o3?=
 =?utf-8?B?b3h6THBWV0h3VHdyeWEyUDFRcUVGZnZib0srbmNYZEtmOWFxS3U3WEVaNy9h?=
 =?utf-8?B?UGxqUWkxK2x2enFQYjg4NmlIazE3QVlxVG1nME5UVlArdm15RDZJN2RnZ2dh?=
 =?utf-8?B?NC92ZEdLUGVEVkd0QmZ5OXhoVHJKZXNiZm1JeHNKUGJsOHc2YTZIK0plNkx5?=
 =?utf-8?B?TWxFSnBWWnVKZFlsRGVsbmt0V1ZrdXNtZDdrUlh5Y1QzWmc0dXIrSGVEM1Av?=
 =?utf-8?B?NTZ6S3p3eDhyc1pJdXlkbWtXWTBMQ2dtYXowVkRvalpOM2QrckJLSDlQK2Rq?=
 =?utf-8?B?UnVDZVlNUitsTFMyOE1PRjNPT05RTG5uY0Y5dGRCdTlLNHNoVzM0OUJncFNG?=
 =?utf-8?B?V0JweGxEelQra0FVM1dXT00xbW55VURqdFB5ZGllVmtXVitaN25GU1NTUDRr?=
 =?utf-8?B?UWhBcm1zT2RoYkRtaXFJa1R4cEZGaWZ6QVJ3V2F3SW9Ldy9oMXc3QTExdzJ6?=
 =?utf-8?B?MGlwQSsvQ1oraVJ4amdQaC8zSE9lY3JuNzVRVWhBeW9BZ1M5UUczb1c2R1RL?=
 =?utf-8?Q?SmPLSexI0UPEjP2YCe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc9fd7d-305c-422b-75ea-08defe7b88b2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 05:26:06.2124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwdIPFVqgS+lF9088fMcDDd1VnM2xETNJOY7PXH/t82NHA4gYS3Bi0mRErjQ5BsJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7210

Hi,

On 8/19/2026 11:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] The DMA engine TX submission path fails to decrement `tx_ring_head` on error, corrupting the ring state and causing use-after-free and double-free on subsequent TX completions.
> - [High] The `axienet_stop()` function leaks pending `sk_buff` structures and their DMA mappings when using the DMA engine.
> --
>
> --- Patch [3]: [PATCH V6 3/4] net: xilinx: axienet: Derive RX frame length from residue in dmaengine path ---
> commit 86c32a60f9e05880f70cba98d261769dec79ad80
> Author: Srinivas Neeli <srinivas.neeli@amd.com>
>
> net: xilinx: axienet: Derive RX frame length from residue in dmaengine path
>
> The dmaengine RX path derived the received frame length from the descriptor
> APP metadata. That only works when the optional AXI4-Stream status/control
> interface is present, because the hardware populates the APP fields solely
> when that interface is enabled. On designs without it the length read back
> is invalid.
>
>> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> index fcf517069d161..67d1b8e91d683 100644
>> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> [ ... ]
>
> [Severity: High]
> This isn't a bug introduced by this patch, but while reviewing the DMA ring
> management, I noticed an issue in axienet_start_xmit_dmaengine() where the
> ring state can become corrupted on error.
>
> If an error occurs during mapping, tx_ring_head remains incremented while the
> SKB is freed:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_start_xmit_dmaengine() {
> 	lp->tx_ring_head++;
> 	sg_init_table(skbuf_dma->sgl, sg_len);
> 	ret = skb_to_sgvec(skb, skbuf_dma->sgl, 0, skb->len);
> 	if (ret < 0)
> 		goto xmit_error_drop_skb;
> ...
> xmit_error_drop_skb:
> 	dev_kfree_skb_any(skb);
> 	return NETDEV_TX_OK;
> }
>
> When the next valid packet is successfully submitted and completes, will
> axienet_dma_tx_cb() fetch the descriptor using lp->tx_ring_tail++ and read
> the freed skb?
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_dma_tx_cb() {
> ...
> 	skbuf_dma = axienet_get_tx_desc(lp, lp->tx_ring_tail++);
> 	len = skbuf_dma->skb->len;
> 	txq = skb_get_tx_queue(lp->ndev, skbuf_dma->skb);
> 	...
> 	dev_consume_skb_any(skbuf_dma->skb);
> }
>
> Does this out-of-sync ring state lead to a use-after-free and double-free
> of the SKB?
>
> [Severity: High]
> This is a pre-existing issue, but I also noticed a potential memory and DMA
> mapping leak in axienet_stop() when the interface is brought down.
>
> The teardown loops free the wrapper structures, but do they fail to unmap
> and free the associated SKBs?
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_stop() {
> ...
> 		for (i = 0; i < TX_BD_NUM_MAX; i++)
> 			kfree(lp->tx_skb_ring[i]);
> 		kfree(lp->tx_skb_ring);
> 		for (i = 0; i < RX_BUF_NUM_DEFAULT; i++)
> 			kfree(lp->rx_skb_ring[i]);
> 		kfree(lp->rx_skb_ring);
> ...
> }
>
> The SKBs and DMA mappings were allocated in axienet_rx_submit_desc():
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_rx_submit_desc() {
> ...
> 	addr = dma_map_single(lp->dev, skb->data, lp->max_frm_size, DMA_FROM_DEVICE);
> 	...
> 	skbuf_dma->skb = skb;
> 	skbuf_dma->dma_address = sg_dma_address(skbuf_dma->sgl);
> ...
> }
>
> Can this cause a permanent leak of SKBs and mappings each time the
> interface is stopped?


These issues are pre-existing and are not introduced by this patch. I 
plan to address them in a separate series.

Thanks
Srinivas Neeli



