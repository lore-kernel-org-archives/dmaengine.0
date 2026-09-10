Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49397345ED8;
	Thu, 10 Sep 2026 01:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003883; cv=fail; b=LeUrcGROjXsgIfuU+JNg+MdT8+lOINiJQPVxk+8pawHNAfCKnGgUhVBxQXycXYnN7jp1bUodtNG/LDieSigOrkMLBb27gZfu24Gw7U9AdvnF6OdG4xGl+85wcaD1MWgrNwe3HXtdDE3U6GtXzyMBTdiicRNKb32OQ5j0koKs7yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003883; c=relaxed/simple;
	bh=dGTz9qyrWubhFh9kn37WpE+lmOWlyykVrnzstZiL8wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AzXjiVIKPg6hArShBlwKkIx00TDprCbO0Mw1Oy+nEzsrev8vEOufPR13dJML7izJn1YMr1fV46IGSmtMWoE4tARnmTH+I7jbrj/FO7LIDyQ6iioQ/ndYWhF+T6NNsoUXyjTbnNYyht/q9eKM/xZukBo9b3cy0yyfG3WImy35oZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V5H8+gzu; arc=fail smtp.client-ip=40.107.159.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V5H8+gzu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lH+5XD9vpnmTKSGOTM7QjIdNDQWSU/Ke5yJCDQo8oFVhmU5kO6H3iA0WXuSK4lz8HxegFecl6E1YyXJPU5vtGk4rustFNbpjdP28BQHLWrytqfFZbSvI3LoFZuJEGdZGeRRy5Rh1hYzgGf4ekCKqJ50GGPU+zBgpHA4P6DjweEUa8uxqGi9rcKF7fpL3pHzsFLITp1k+WxZTUf3GcUO27+2579xRxVmcf1kMgA7567cLoOymOssvih96jMZSx1SMB5OMfgjtJsY/Pg5Zh/4pnonw+J1GFsntH+AVCeoVUEVxkxNyTV+KQFsCIuKAosFlYC5m5ad5IMgU39uwgtGQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ga1OBzsYrZYZDdEZEINH9YDKgVzIaWmwbBB5W2y6N9A=;
 b=JUCRpF9tReVhK4q2ejgpReeWrumdg03DKY1KmsmOZEiyemB0EIotttbZIWwJJPedOp17eAPLgJuUnFKiHr8r8SjXZcaqjgQt1vOfuvNpXMBaajzcK1kWjcJ3cLROWnyi97fovzd4Kj16SsQhA2EVgTclNmUoEqYARuOzuGuoGiJFJEM7MoH0vT+08JAlTGiwYy6cHO6XSWztD54vxwK0V2U1iCt8hrcr5t5RWiW2/x4OSti4VSoHa8u3Q3g4LsxrXQ5AVACkQDGqTYPzQHRx8DGd2gxG/+qWNpckVaFddFqZammgvYykRY20rVWJ/KCQQZgT6/3bpPn7kEATTpV1Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ga1OBzsYrZYZDdEZEINH9YDKgVzIaWmwbBB5W2y6N9A=;
 b=V5H8+gzu5tr+s2EeNUfU+M6eCfw6B7UAaXCWQq+ZQCa9m/mKFzPxr8YlJQwuMOuYpsS4SrkgXd7Rth7Fu8BvrmwuCiJmafStA5fmMZBhiLEaFnmS9tNMX7oI9FQzeFJgq42gscBAmgBPGgBALT3yPFgROTEoCBBChE6KOkiUrO0t+arkl7eJPyOV5tiqC76EkzMyBLI3sGYjqYfkApZrZYfm3AmxJmtzk7uTtu9xsMYStbPLe3pJ3hJKqK7pSyvuDt3rNFcr+Im1OQpOa0BfFjN2I5F66TtbKtseO9gnHWtVrtPYYBhCtjBYEuu2pt+1QjdpSsjbbzHLk370ZEWTCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6943.eurprd04.prod.outlook.com (2603:10a6:803:13a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 01:31:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 01:31:18 +0000
Date: Wed, 9 Sep 2026 20:31:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Saeed Bishara <saeed@marvell.com>,
	Dan Williams <djbw@kernel.org>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Nicolas Pitre <nico@marvell.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: mv_xor: kill tasklet on channel add error path
Message-ID: <aqIIWyQs-Kyw7wIa@SMW015318>
References: <20260909234601.101883-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909234601.101883-1-rosenp@gmail.com>
X-ClientProxiedBy: CYZPR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:930:8a::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 60306104-deaa-461a-e667-08df0edb3604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|19092799006|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mfM4PopoPpj4D4agOf9CFcMnpRf/lRM0xCvyVaUpehxId2ldI/ISzVA9nF5h+aCLxz/2dLMJFXds8UwhieE9lqldD3lWcsDPf6U75zhTYh1TQnVcOIFdEBSYLRIiDH0N+dqbX1Qc0WNcDkExKZzt8Hb8/AzmngVQ8aVhZE+Kh83eh53bmLiW4Z/hKSTAcGolyjX+tt25WK98BSEchHRPWVgg9+0MXKdIbSPDbg5f7sngvUunFhr2OUkSj7FBGYY+RRL/c80Q5/VtVKM82x/5/zKdQXr2UROMrcckcGvwWg3Ix3ly+z7WiWdkiQxQpnEBdaL3SPWWku9E2nSkx1RZeyfVTXYja6GV11Tu112OO3WcGw55ZbBlvPlXdw6SImpJbZolLaJ0u5o2XhO3T5+3G6i+KpakkYkWKIivEHowyj0Wam6pddV6Z5TLXAeKVY9LwGAcifVtjoZj2jiHlhfFpFtIw8WXu8cF7Zh1bvkSo407g1HtDEfiw2eFLqyw7CTWQaS9VXy5CsXanSl/VipWnmLWZj6IqF1MXBzPU11HxChglctYeTXeKIVg6FGHiNdh7LIK7vF+IGXeT3t9uSulFZs9YY1IF7CnCxo8vn9emE0bljDxIZchP4+WuexkDXO1pf3O9pTM9ekVcFn3X235djmqSFaeaTyn0+Ek/JNfwUE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yiK6i3xsnAvax94CNCqgjCvbMP7RQ7sZTohbTnSkD6MWqBMIXbqpyOKwpw3u?=
 =?us-ascii?Q?3631dcwsjmF1SPYzUfsyArSXKH8vDwWRGsjgBkxeFFOR9vQyHAiSoImEI5WU?=
 =?us-ascii?Q?n47SSh+/w/wEeIPmTyXlUL1U9/oT6y0L4nCfYd7ZelLMo/pIIr42L3rnWk9R?=
 =?us-ascii?Q?BO32B7HNjHcfr4AUC4TChm2VP04xbRGHUccY1b5Q/UJpS5H8ksIzehC7o9Z9?=
 =?us-ascii?Q?UtGq8ooMxm9NblCQLb9/eGvjswlbsm7kTYBJPz2QLMnaZQN8jGrynKEdhpFK?=
 =?us-ascii?Q?KflHpIpYflPFHr2DG61Ubhhy/X7iWMQijjqY/Yfi5h0/iXzFOMveuY3Rb9RB?=
 =?us-ascii?Q?p+OsyaCMbDNg2y3rxAjew5jPgVb+1e281/6D9f/242WBtBjIqx+msT1ak6T7?=
 =?us-ascii?Q?fiT4xnYBuJljNsvOK4pa1DDND9/0+0KUqCgjuAbbFjA/TGd2pvdZs7kJFZS7?=
 =?us-ascii?Q?QRB97j45p+t19KZBQtNa5GhA716P3QIQnvRaTtEc83H7Sjr2HWewbqx9RQHj?=
 =?us-ascii?Q?EHgToIl60jDAOM8JStzt4ZZ051nxX6v1yfkL8pSRfY42XmDh3ieGbMPkZSSP?=
 =?us-ascii?Q?BCqqdfF5V8nbD2sm5TJKSBHe4ReSZHOdC3oHQYfFlKwi4Qa4mILiQcxcgtfd?=
 =?us-ascii?Q?b+g/DTOi3e/rZObn3pt/wT/j+ExGwKJEwJs+5KnG+TAS2IMAhA/NwgoGRdzm?=
 =?us-ascii?Q?qyYtgDP7C+riUQ/w0HtqPErmJywh5XJ+Wwe5EtMBF4b2kmq35BzXo6lp3IRG?=
 =?us-ascii?Q?duqKsoDcxDA9JPAiGtpOOY4Fc6ETL2N0vhYZUL+iiTajlneVi5Tx5BuVKVHZ?=
 =?us-ascii?Q?uGAPkKHyeZUC3XlvP/PBgo55TdMqtaj3aZ7BbD5Q1JcywflxxP49dWijJyNT?=
 =?us-ascii?Q?g/E3FBFmxbUBFU4YEwI8Gwtkk/9guoq6BUrTab69Jcm7Plb1bhePhJ+wEOFu?=
 =?us-ascii?Q?VwhIBXIeqKm2Lp9AE5ddu0D/ME0MNBXjemzeZqJ09FAPsRPjBtluX7Sq7Lek?=
 =?us-ascii?Q?Q5pVqVdNwMF8wCXX5Bs05cHrB1udTBM3pznkasFmV4EpSRXJYG7SGjgV+IvU?=
 =?us-ascii?Q?3rPq7GkRNakoSH7jAyRvtBI997dYpP2SRt1lWPep29IzWYIdeJTEksUm2tbZ?=
 =?us-ascii?Q?PpxpHy/AouY8S1DE16R8EabM2tM5IKAg7vxO2aDcz97loCS0cPxFkZ004PTe?=
 =?us-ascii?Q?ufMxfGy8XoBlAarmFh9qXHXaTJ6DB9754vn8Sm+7qpW2p0Fs2EbiaeRjIZcY?=
 =?us-ascii?Q?IsFFdRaNI2xlrgXWoWVpRXgz4gZ2ehy5Gb2lw8ACB3ZvoJYCGL/fllPhSFwX?=
 =?us-ascii?Q?0/xqP4p8w5mVFbK9m0E6RZ5E20BzZxNFNY49lQnA8u5i5oeiUIcOjppRtJZK?=
 =?us-ascii?Q?AQnkUnAqZQgwcKK+fPIpDM8gM9kJyy3Dp0GLrOj6J3DfK3xNy3JrHUNv2e/C?=
 =?us-ascii?Q?PKh1qhN4vrPmiueJQWgByKluf2WB2jtVbvIc5YqUOxd3SEHHQidxmAPCpOoM?=
 =?us-ascii?Q?+OzfczoBxLsCq24BqpaeVA8bDx8j8OdlZaJG5kxbXWi/KMxAirhP4KppgQrX?=
 =?us-ascii?Q?WNqI4BkJTb8o1LOrbZXcSqW5ws2glrBKim1Kk4YTg4xv0/5ZsfRjvZXN0/PB?=
 =?us-ascii?Q?XQbBSvtR1IwlfDBFvBQx4tR9NNxScnv7dq4sWh9mi5MYpJXKmXnPm1qLQxNz?=
 =?us-ascii?Q?J+U6GFZh+Dr3I9KG5FLo6wOyEeFAdgfpr1R/pTfiDqbyfTM3MWxrBBxgSDKn?=
 =?us-ascii?Q?EAu3v6X6NxMw3K6xGCDTBir5UTLVWmPUCf2PWMiNiuwBLnnNa0RP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60306104-deaa-461a-e667-08df0edb3604
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:31:17.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5URTsv+IwInUQPIhYR6TRxM5xgrp+EWmEUgc3HjjBvCYazJgIkBy61TwTZuaqbdY8otC+zicQqxNGe3g/HxtD8J8CbUdCMRIn72K8bGdij/frkZ7xaEKCSh2fIusB46
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6943

On Wed, Sep 09, 2026 at 04:46:01PM -0700, Rosen Penev wrote:
> If request_irq() succeeds but a later step (self-test or device
> registration) fails, the error path at err_free_irq frees the IRQ
> but does not kill the tasklet.  A previously scheduled tasklet can
> still run after the channel is freed, accessing freed memory.
>
> Add tasklet_kill() after free_irq() on the error path.
>
> Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mv_xor.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b089..24f22db5dfa1 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -1162,6 +1162,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
>
>  err_free_irq:
>  	free_irq(mv_chan->irq, mv_chan);
> +	tasklet_kill(&mv_chan->irq_tasklet);
>  err_free_dma:
>  	dma_free_wc(&pdev->dev, MV_XOR_POOL_SIZE,
>  			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);
> --
> 2.55.0
>
