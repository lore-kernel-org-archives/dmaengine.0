Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794515967;
	b=ZYHOTeuNTdQo0JaWjiGd9uTT9Cp8E2ST8o6yPS4aKD/2S32ZBQpvdmUYfWI+mW05aHqI
	 B94MrlhzI7Ag9lpSDdB8DEIcs6/f4621uCgu0uM9QFIXPTi22Hb8IwmfQUVDBSKUKMGW5
	 bzqCbbbmsWHedGV67A/DBHGNr2PLYgBtuEMFRUvVQTHf9umxNyeqqasFKeCbmnpcC/QKd
	 cUXMyXJ/+tkorEjHuHel8uaOqciaQn0DZpFfoJQxwnCLq3ucgZUQm7D7WmD/OQZvaRFnH
	 CdcyYoqN5yrwGyQSE/JZInVZlUbMdD1P5s8NGoMA2lUgXjD0UJknWsO7m8ZvjXAgjMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515967;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OjRhRvmwpc4eJf2zhkn5B2B8d0cGjHN/FXf4IwQeokA=;
	b=l6R3QuLao7N1iLAFEIMqzX9TTvrA3V+Rrxx8FEmDwWqHwPJIQVWJqGhGnRYRj5+u/NAj
	 2PLwa5VnIrxhRv5EEqbBBzXFC2Vort2MSax3jdbc0fdkgChntyu17l2jYosU90hDdMfjl
	 s57US6ZHRPRD4fr4OINQMfK4d/MhMS3V3Zrq57GHVg8QOSybkOY09eLqW8vhsE5PYT6Hz
	 TNjuS5bC2FyDdNu616hNF5dQb5mjGv2UCSFZy1bgzdGoPKal3vCbRaF50DMn1IZ+5HvHU
	 uySdkAnImKgCciqwnv8X4KRlrTXQMaOaUzbHjOGcSylzq6NCHSQFAy0oyQxZ8bSGUkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Vo2q79qu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.36
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013036.outbound.protection.outlook.com [52.101.72.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A7F606A323;
	Thu, 12 Nov 2026 20:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A7F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Vo2q79qu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KabnXifhZpfI/jEzYbbGySb7nrIexrk2yNIxbvRukPw1LaQQ9xJrgUsPDXhOSBAw0HBI6r1J6xogdahjNG4RQvsCsAJTEpdoL44WZ46OpWwcDSGZlIOJyzFmxenYEFpQ3iEuU89DGQMNHBMGdD4nJUkz7jO03Sc0+DSbNqD91h4wdtuBC4TCQFYJJtb7k9Mjw9PaeLYYgNo0u71ruAyJeOe+kESzhLXCE9k1JPuG1DTxxV093gAZc/dd3rgI815PqAhmiMUvfXkWYYA0JzhjlLUxVqXN8/UMfSyApKXUDO+XYuvlUyzUqLRX8K/sivzjW44s8IfQmPJGjBRpGNU/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjRhRvmwpc4eJf2zhkn5B2B8d0cGjHN/FXf4IwQeokA=;
 b=lQgTttXqqYaYkmAkT8h1CFuAmMhndADx5cJKnQtXGUeJOkkEIUtu9BHmePqAzUQpMinh0RTycl3M1ezZ7GLzj2vEGWi49hB/X2MPnPmby8G5VwHHBU+6/HT5S5MOixRmuI95k2xbPfc/RsLGYMaBFfqhZFFLXDzWM/v88+oxZk4PyPUYsQ83QjYbVGnzICu33vh33Egx3Uqtish87XC7VIiXoxfZB0ZlVcEQLaMOAgErSRvf+Z+ecSL8fnP+gCNMrqoRLGtYGGpi5XmJecKpo9HWbtx3TUEPVcS/ECNmeTi9hXdBRrAZGOe1tBmt4SNgFKR/IyxQlCSFFsRKt2YX1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjRhRvmwpc4eJf2zhkn5B2B8d0cGjHN/FXf4IwQeokA=;
 b=Vo2q79quyn0TcNAWcX696Iv07XSFtFUBg0CZtgh37Ty5DYZrwMPLnxUD9YvqIvY/ZaCK7bCICY0WLUzCfV5aWVsitlkE4bOsn5oqK6cAOWjkmVUoSRoIVq/ZtuXNBquke8Oh/uA2QWH83EmpNR++hnItWTndqdwdLUAdWN6GkdLiyes5psrsAUzs3ZQSg2dPvDDv8YKd7kM6Jkg6wUgKBbl+yO3V/WVSfbU2udxY/GxyDn5z8hRlOecbrsphCtxdYur0uioMwLzcoYhrNG8Wl70iSJxUOHiBJDWrv5Uzp5Kt8ex+rofW5nWFUmXqS68J2Vryl1hEjAkOmE3OjMrkWQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB211885.eurprd04.prod.outlook.com (2603:10a6:150:38a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 20:34:20 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 20:34:20 +0000
Date: Thu, 12 Nov 2026 15:34:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] dmaengine: arm-dma350: Add slave and cyclic
 transfer support
Message-ID: <avYixCLEChNjAvtK@lizhi-Precision-Tower-5810>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
 <20261106013453.1134239-3-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106013453.1134239-3-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: GVX0EPF0005F68C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::12f) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB211885:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f751a4-9ff4-4599-2788-08df40fc5482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|19092799006|1800799024|4143699003|10067099003|5023799004|11063799006|56012099006|261021123027099003|261026121527099003|261022075727099003|261021133027099003|261021130227099003|261026140227099003|261026135527099003|261022115727099003|261026130827099003|261022105027099003|261021135927099003|261028144727099003|261102123227099003|261022113327099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0PGXLejjIwwFTsVqWZ5qyWOrz+snfPzxHA1Sgyc0FNdEV8e82KZCEFvsi0ersbMlXttnVaDAUWc17g3D1IORqpTXqrdfHc8SQV7s8dBxQEWeHekZR9gE7hDjqzmJ0S3ViGn0eSHVQ+BgByOrNWNEjiuPN+7VV8Tw6LS26RcKN2qhqsBZpCg0e1DzM/9TIvtAwws/duLHZwpAatpb5D02FlmQSdwFbglxipRs5VJW5NZXfvpQtD+tGIXukzevBXn0kq5pB+p7Dh4Rssmqzl32NmeXGCUZl4YhrzQRzba6ch9xunWxCG0FXdygWZkJTjXXRpmQMVZ4IyAUZnUlkNTl+6sBPOMo7kPVNYmSfWcKMXop7O2dIXoherzjnm/CExbmjECyDB2nhF7osntFpGhDmk2CkxRjnp0j6Hx1EqhgKPjtCZhPbopFF7zmjI6L8asEfOWHF/0lDCpqQ6geaGE4tPhWfoYUfpb/+qDTl8AU8P5IQVQmJWXmc4xZXqbEkwuy/qyVSRvRICjnBnENOlhM1+fQzEikmnmvj1xqEmbz7NxerZIK65MCvf1qz00CjoYhXW+/TfKDMTaOMS4rPldpNri7pZWlVZ65neQVmWlMxbljsdTdheZJ1oN3LD9Djo0v1mBJ8VnCmjwml0pCNTZ79OdWCnZ7aLJJr+yRizSx3Zc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(19092799006)(1800799024)(4143699003)(10067099003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261026121527099003)(261022075727099003)(261021133027099003)(261021130227099003)(261026140227099003)(261026135527099003)(261022115727099003)(261026130827099003)(261022105027099003)(261021135927099003)(261028144727099003)(261102123227099003)(261022113327099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ljin9pejDB7hJrXTdZUDzUVfWl9nX6SEA13sYVNZFUtrNRNTfbMmzCD9r6+0?=
 =?us-ascii?Q?qomCY8H5MsqeOhK1Wqe45becsl7UkN0Pf0pM8BitgVCA3V6e7GGT8KewsQ8+?=
 =?us-ascii?Q?12ruBQW5V60R3YKbJDhlcVNqFURDFBN+4DIc7Rwo4AAmN6o8brQ8DfN7hT7I?=
 =?us-ascii?Q?a2UsZS8Z7fPjzI4mkIIQh6OaNgLv4Mj8bzG8mIqz8UHPKDByB+DnjMoSaZnx?=
 =?us-ascii?Q?ikm3npj/OGBa/zFdsYTPwLRUSxMgabFTKpWPOiLfK29oZKF7uAA5u+0ok9y9?=
 =?us-ascii?Q?BDCF2sBzQI8hEOofBoA2Wq6hGZ8HMPZOI6MaCE3eqiZlG4QpJiue08EUP/z7?=
 =?us-ascii?Q?zUSq4+6lAPlMcFE9+i/azEwommhUt8ipbd9UBgxS2JKtQFl5nXkoPPOJS0u/?=
 =?us-ascii?Q?R9Soe0DXUwamaCtpaBREaXdN/yGqmzzhemyoldhsDTV924+neur8idYekfdw?=
 =?us-ascii?Q?S1uOsUWKWN5+sLkK4i2hSGqTKheuRWYTtyPZkqFSDAgg3/En9tQ5LdW+QM8I?=
 =?us-ascii?Q?v5rAZPSgnwAg18JhHfEVBIEEgdugsqeCKNRFlEJEWC2QPSTrL7XMJe8X1gyk?=
 =?us-ascii?Q?SkerRkfc8zrFO8cQKX2os4efLS6WoGpLfc8CFFf8VEb9QkXvdM/CvRl4B/Fc?=
 =?us-ascii?Q?soEXDmBj2VcZNljuHy1yl7FcnkeoM80LUStDRU0gcvHyaKVMyYL44s4Qu3Lb?=
 =?us-ascii?Q?lqIQ10goCTFsm7DNK8c9wA3mwW9vMAMagQTlkdz0YMFAX4PYezMRMy/tA3NE?=
 =?us-ascii?Q?eKd2tbSQbEcUrdpbhgyxCBRoC3TL1WQrd84d+3YKTlIUFyufJEl6OHjASYoT?=
 =?us-ascii?Q?Gxs0ZpxRqEUQU8+dZqGPYxyE4K1vY4QpQ+kxDWlG90L2NImc/bITyUMzzbhG?=
 =?us-ascii?Q?YE/LtEidwVPOnE+MbmuZEK5AvaJc92wFj1/mrLLBEf4Rpvd3yU4vu/PEAjPx?=
 =?us-ascii?Q?RmYKkUo8o9EnmF5BgzlA4WKPcGev489A72uXAyCOI+U8IUZsXZorxHiXTMx5?=
 =?us-ascii?Q?Lva5QaRnDfJ37RWcfYSL5yKmWgI6W5XLP6McXTrMQWoer3Oj3kaPBt0E0NuC?=
 =?us-ascii?Q?bl7iY5dLRDeNIq1AiQBBTVN1fazJImEA629x2+deJk/jFEDOr36p23x8YxnF?=
 =?us-ascii?Q?0egNCe8wU7UYXxM6SYifgg4M+Oe7/HOwJqmm9El+GTJMiWwg0VCag1f+N7uO?=
 =?us-ascii?Q?BA/JEJNLXvKO88ZZA8ed+I/t6QoLtXFL75DzeTs37JBxG6yMb3rjIWpV3B11?=
 =?us-ascii?Q?NK5mqqJFtp6g7cdhSltAqVC6YkKwJOMXVDNWy2sxCxpwoQd7ld5IBrT44qV8?=
 =?us-ascii?Q?R+VWTBhnW4IMNdteR/U0ua8LVh9Bm8EsZ8LUHg7lRuQb3kySsqBQO1eyRuJn?=
 =?us-ascii?Q?u5+DNoJTSIQ3RJwzv8MvNOjUp3cayf6c2dx2IJ2M4fSGSS1MFgyGPEVTQ5Q0?=
 =?us-ascii?Q?87bVXLWtaT4iJ55rr4HAZEOe3r1SjWyuWKazKQM5a+xMxAohNwjoIURq/QPm?=
 =?us-ascii?Q?1E8s28JVEa7bWcDOxasnLsI3yTzeMgk0298xAz4jEXuyKAzD+i5ZzUiivofP?=
 =?us-ascii?Q?ZC/p9T/iODV7aGR8LU8L+lMbLnnLPQ7KhcecXFEylPSWkq5pvJbDX9sawxvk?=
 =?us-ascii?Q?cPe3SbpI3qcn+nYr6ix263u7JIdvXWKoslJh5thVaH+ojl8BeZZmMmPgfJS8?=
 =?us-ascii?Q?yPiYC3psoqAtpbwqMNG5Xabctc+fLPahT4i0PE7r1hBp3fifeN9O9mQb2/mj?=
 =?us-ascii?Q?eKjYaMnQVr7+Ya+sah2/D0IpYHME18Lm1v9h659BZzPQuakVBLyx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f751a4-9ff4-4599-2788-08df40fc5482
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 20:34:20.7299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOjTBk0ZqKI1s+a/eJWNLUiVQL1DhA3RFvKb/7WfKAcSm+jWqvTiGp2y9/L946cZf+Puh60nJV+sZBMbmPbWS5ZI//shx50g9zAufYMWlNQTvLTo/z6NRW7f0agtq/wI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB211885

On Fri, Nov 06, 2026 at 09:34:50AM +0800, Jelly Jia wrote:
> The driver currently supports memory-to-memory transfers only. Add
> peripheral scatter-gather and cyclic transfers in both directions, with
> trigger configuration, period callbacks and residue reporting.
>
> Keep each peripheral DMA mapping for the lifetime of its descriptor so
> preparing another transfer cannot invalidate a queued mapping. Allocate
> linked commands from a coherent DMA pool to respect the controller's DMA
> ranges and permit freeing them from the virt-dma tasklet. Store commands
> in little-endian format and order writes before publishing them.
>
> Set the trigger block size from maxburst in both directions. Sample the
> link pointer around the hardware residue counters and retain the cached
> residue if the channel advances during sampling. Include submitted
> descriptors in status queries and protect slave configuration updates
> with the channel lock.
>
> Use an invalid request sentinel until a request line is assigned. Clear
> the request and slave configuration when channel resources are freed,
> but retain them across termination. Keep a failed channel in DMA_ERROR
> until termination so queued work cannot overwrite its status or residue.
> Allow termination to reset the status even without an active descriptor.
>
> Check DMA mask setup and register the OF DMA provider only for OF-backed
> devices. During teardown, request channel stop and poll STOPCMD with a
> bounded timeout. Warn on timeout but continue IRQ and virt-dma cleanup;
> this is best-effort teardown, not confirmation that hardware has stopped.
>
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
...
> +
> +static void d350_fill_slave_cmd(struct d350_chan *dch, struct d350_desc *desc,
> +				u32 *cmd, dma_addr_t mem, dma_addr_t dev_dma_addr,
> +				size_t len, bool link, dma_addr_t link_addr,
> +				enum dma_transfer_direction direction,
> +				enum dma_slave_buswidth width, u32 maxburst,
> +				enum ch_ctrl_donetype donetype)
> +{
> +	bool mem_to_dev = direction == DMA_MEM_TO_DEV;
> +	u16 xsize;
> +	u16 xsizehi;
> +	u32 devcfg;
> +	u32 memcfg;
> +	u32 trigcfg;
> +
> +	desc->tsz = __ffs(width);
> +	xsize = lower_16_bits(len >> desc->tsz);
> +	xsizehi = upper_16_bits(len >> desc->tsz);
> +	devcfg = d350_device_transcfg(maxburst);
> +	memcfg = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
> +
> +	trigcfg = FIELD_PREP(CH_TRIGINCFG_BLKSIZE, maxburst - 1) |
> +		  FIELD_PREP(CH_TRIGINCFG_MODE, CH_TRIGINCFG_MODE_PERIPH_FC) |
> +		  FIELD_PREP(CH_TRIGINCFG_TYPE, CH_TRIGINCFG_TYPE_HW) |
> +		  FIELD_PREP(CH_TRIGINCFG_SEL, dch->req);
> +
> +	cmd[0] = LINK_CTRL | LINK_SRCADDR | LINK_SRCADDRHI | LINK_DESADDR |
> +		 LINK_DESADDRHI | LINK_XSIZE | LINK_XSIZEHI | LINK_SRCTRANSCFG |
> +		 LINK_DESTRANSCFG | LINK_XADDRINC | LINK_LINKADDR |
> +		 LINK_LINKADDRHI |
> +		 (mem_to_dev ? LINK_DESTRIGINCFG : LINK_SRCTRIGINCFG);

Suppose should update it after other field ready. and need dma_wmb() to
make sure other cmd already written to memory.

> +	cmd[1] = (mem_to_dev ? CH_CTRL_USEDESTRIGIN : CH_CTRL_USESRCTRIGIN) |
> +		 FIELD_PREP(CH_CTRL_TRANSIZE, desc->tsz) |
> +		 FIELD_PREP(CH_CTRL_XTYPE, CH_CTRL_XTYPE_CONTINUE) |
> +		 FIELD_PREP(CH_CTRL_DONETYPE, donetype);
> +	cmd[2] = lower_32_bits(mem_to_dev ? mem : dev_dma_addr);
> +	cmd[3] = upper_32_bits(mem_to_dev ? mem : dev_dma_addr);
> +	cmd[4] = lower_32_bits(mem_to_dev ? dev_dma_addr : mem);
> +	cmd[5] = upper_32_bits(mem_to_dev ? dev_dma_addr : mem);
> +	cmd[6] = FIELD_PREP(CH_XY_SRC, xsize) |
> +		 FIELD_PREP(CH_XY_DES, xsize);
> +	cmd[7] = FIELD_PREP(CH_XY_SRC, xsizehi) |
> +		 FIELD_PREP(CH_XY_DES, xsizehi);
> +	cmd[8] = mem_to_dev ? memcfg : devcfg;
> +	cmd[9] = mem_to_dev ? devcfg : memcfg;
> +	cmd[10] = mem_to_dev ? FIELD_PREP(CH_XY_SRC, 1) :
> +				FIELD_PREP(CH_XY_DES, 1);
> +	cmd[11] = trigcfg;
> +	cmd[12] = lower_32_bits(link_addr) | (link ? CH_LINKADDR_EN : 0);
> +	cmd[13] = upper_32_bits(link_addr);

can you use enum/define/struct to avoid hardcode


> +}
> +
> +static void d350_store_slave_cmd(__le32 *dst, const u32 *src)
> +{
> +	int i;
> +
> +	for (i = 0; i < D350_SLAVE_CMD_WORDS; i++)
> +		dst[i] = cpu_to_le32(src[i]);

convert direct at d350_fill_slave_cmd(), most likely cpu_to_le32() do
nothingh, to avoid additional data copy

> +}
> +
> +static struct dma_async_tx_descriptor *
> +d350_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
> +		   unsigned int sg_len,
> +		   enum dma_transfer_direction direction,
> +		   unsigned long flags, void *context)
> +{
> +	struct d350_chan *dch = to_d350_chan(dchan);
> +	size_t cmd_size = D350_SLAVE_CMD_WORDS * sizeof(u32);
> +	enum dma_data_direction dev_dir;
> +	enum dma_slave_buswidth width;
> +	struct d350_desc *desc;
> +	phys_addr_t dev_cpu_addr;
> +	dma_addr_t dev_dma_addr;
> +	dma_addr_t mem;
> +	struct scatterlist *sg;
> +	u32 maxburst;
> +	size_t len;
> +	int i;
> +
> +	if (unlikely(!is_slave_direction(direction) || !sg_len))
> +		return NULL;
> +
> +	if (d350_slave_params(dch, direction, &dev_cpu_addr, &dev_dir, &width,
> +			      &maxburst))
> +		return NULL;
> +
> +	desc = kzalloc_obj(*desc, GFP_NOWAIT);
> +	if (!desc)
> +		return NULL;
> +
> +	dev_dma_addr = d350_map_resource(dchan, desc, dev_cpu_addr, width,
> +					 dev_dir);

Generally, access peripheral register space needn't map, does your hardware
go through iommu when dma engine access register FIFO?

If yes, I think it should map at set_config to avoid map it every time
at prepare sg.

> +	if (dma_mapping_error(dchan->device->dev, dev_dma_addr))
> +		goto err_free_desc;
> +
> +	if (sg_len > 1) {
> +		if (d350_alloc_cmds(dchan, desc, sg_len))
> +			goto err_free_desc;
> +
> +		desc->cmd_len = kcalloc(sg_len, sizeof(*desc->cmd_len),
> +					GFP_NOWAIT);

feel like, needn't save length informaiton, you can get such informaiton
from cmds

> +		if (!desc->cmd_len)
> +			goto err_free_cmds;
> +	}
> +
> +	for_each_sg(sgl, sg, sg_len, i) {
> +		enum ch_ctrl_donetype donetype = CH_CTRL_DONETYPE_CMD;
> +		u32 command[D350_SLAVE_CMD_WORDS];
> +		dma_addr_t link_addr = 0;
> +		bool link = false;
> +		u32 *cmd = desc->command;
> +
> +		mem = sg_dma_address(sg);
> +		len = sg_dma_len(sg);
> +		if (!len || (len >> __ffs(width)) > U32_MAX ||
> +		    !IS_ALIGNED(len | mem | dev_dma_addr, width))
> +			goto err_free_cmds;
> +
> +		if (sg_len > 1) {
> +			cmd = command;
> +			if (i < sg_len - 1) {
> +				link = true;
> +				link_addr = desc->cmds[i + 1].dma;
> +				donetype = CH_CTRL_DONETYPE_NONE;
> +			}
> +			desc->cmd_len[i] = len;
> +		}
> +
> +		if (check_add_overflow(desc->bytes, len, &desc->bytes) ||
> +		    desc->bytes > U32_MAX)
> +			goto err_free_cmds;
> +
> +		d350_fill_slave_cmd(dch, desc, cmd, mem, dev_dma_addr, len,
> +				    link, link_addr, direction, width, maxburst,
> +				    donetype);
> +		if (sg_len > 1) {
> +			d350_store_slave_cmd(desc->cmds[i].words, cmd);
> +			if (!i)
> +				memcpy(desc->command, cmd, cmd_size);
> +		}
> +	}
> +
> +	d350_sync_cmds(desc);

Needn't do memory barrier here, suppose there are issue_transfer() have
register write, writel() will do that.

> +
> +	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
> +
> +err_free_cmds:
> +	d350_free_cmds(d350_chan_to_dmac(dch), desc);
> +err_free_desc:
> +	d350_unmap_resource(dchan->device->dev, desc);
> +	kfree(desc);
> +
> +	return NULL;
> +}
> +
> +static struct dma_async_tx_descriptor *
> +d350_prep_dma_cyclic(struct dma_chan *dchan, dma_addr_t buf_addr,
> +		     size_t buf_len, size_t period_len,
> +		     enum dma_transfer_direction direction, unsigned long flags)
> +{
> +	struct d350_chan *dch = to_d350_chan(dchan);
> +	struct d350_desc *desc;
> +	phys_addr_t dev_cpu_addr;
> +	dma_addr_t dev_dma_addr;
> +	enum dma_data_direction dev_dir;
> +	enum dma_slave_buswidth width;
> +	size_t period;
> +	size_t cmd_size;
> +	u32 maxburst;
> +	int ret;
> +
> +	if (!buf_len || !period_len || buf_len % period_len ||
> +	    buf_len > U32_MAX || !is_slave_direction(direction))
> +		return NULL;
> +
> +	ret = d350_slave_params(dch, direction, &dev_cpu_addr, &dev_dir, &width,
> +				&maxburst);
> +	if (ret)
> +		return NULL;
> +
> +	desc = kzalloc_obj(*desc, GFP_NOWAIT);
> +	if (!desc)
> +		return NULL;
> +
> +	dev_dma_addr = d350_map_resource(dchan, desc, dev_cpu_addr, width,
> +					 dev_dir);
> +	if (dma_mapping_error(dchan->device->dev, dev_dma_addr))
> +		goto err_free_desc;
> +
> +	if (!IS_ALIGNED(buf_addr | dev_dma_addr | period_len, width))
> +		goto err_free_desc;
> +
> +	desc->bytes = buf_len;
> +	desc->period_len = period_len;
> +	desc->periods = buf_len / period_len;
> +	desc->cyclic = true;
> +
> +	if (d350_alloc_cmds(dchan, desc, desc->periods))
> +		goto err_free_desc;
> +
> +	cmd_size = D350_SLAVE_CMD_WORDS * sizeof(u32);
> +
> +	for (period = 0; period < desc->periods; period++) {
> +		u32 command[D350_SLAVE_CMD_WORDS];
> +		dma_addr_t mem = buf_addr + period * period_len;
> +		dma_addr_t next = desc->cmds[(period + 1) % desc->periods].dma;
> +
> +		d350_fill_slave_cmd(dch, desc, command, mem, dev_dma_addr,
> +				    period_len, true, next, direction, width,
> +				    maxburst, CH_CTRL_DONETYPE_CMD);
> +		d350_store_slave_cmd(desc->cmds[period].words, command);
> +		if (!period)
> +			memcpy(desc->command, command, cmd_size);
> +	}
> +
> +	d350_sync_cmds(desc);
> +
> +	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
> +
> +err_free_desc:
> +	d350_unmap_resource(dchan->device->dev, desc);
> +	kfree(desc);
> +
> +	return NULL;
>  }
>
>  static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
> @@ -228,6 +750,7 @@ static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
>  	if (!desc)
>  		return NULL;
>
> +	desc->bytes = len;
>  	desc->tsz = __ffs(len | dest | src | (1 << dch->tsz));
>  	desc->xsize = lower_16_bits(len >> desc->tsz);
>  	desc->xsizehi = upper_16_bits(len >> desc->tsz);
> @@ -266,6 +789,7 @@ static struct dma_async_tx_descriptor *d350_prep_memset(struct dma_chan *chan,
>  	if (!desc)
>  		return NULL;
>
> +	desc->bytes = len;

use new patch for memcpy and memset change.

>  	desc->tsz = __ffs(len | dest | (1 << dch->tsz));
>  	desc->xsize = lower_16_bits(len >> desc->tsz);
>  	desc->xsizehi = upper_16_bits(len >> desc->tsz);
> @@ -339,6 +863,69 @@ static u32 d350_get_residue(struct d350_chan *dch)
>  	return res << dch->desc->tsz;
>  }
>
> +static u32 d350_get_sg_residue(struct d350_chan *dch)
> +{
> +	struct d350_desc *desc = dch->desc;
> +	size_t cmd = 0;
> +	size_t i;
> +	u32 linkaddr;
> +	u32 linkaddrhi;
> +	u32 hi_new;
> +	u32 lo_new;
> +	u32 residue;
> +	u64 next_cmd;
> +	int retries = 3;
> +
> +	if (!desc->cmd_len)
> +		return d350_get_residue(dch);
> +
> +	/*
> +	 * CH_LINKADDR points at the next command. Match it against the command
> +	 * array to find the command currently executing, then add every later
> +	 * command which has not started yet.
> +	 */
> +	/* The channel may step the link pointer between the two reads */
> +	hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
> +	do {
> +		linkaddrhi = hi_new;
> +		linkaddr = readl_relaxed(dch->base + CH_LINKADDR);
> +		hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
> +	} while (linkaddrhi != hi_new && --retries);
> +
> +	next_cmd = (linkaddr & ~CH_LINKADDR_EN) | ((u64)linkaddrhi << 32);
> +
> +	if (!next_cmd) {
> +		cmd = desc->ncmds - 1;
> +	} else {
> +		for (i = 1; i < desc->ncmds; i++) {
> +			if (next_cmd == desc->cmds[i].dma) {
> +				cmd = i - 1;
> +				break;
> +			}
> +		}
> +		if (i == desc->ncmds)
> +			return dch->residue;
> +	}
> +
> +	residue = d350_get_residue(dch);
> +
> +	/*
> +	 * If the channel stepped to the next command while CH_XSIZE was read,
> +	 * the size belongs to the command which just finished and the sum below
> +	 * would count the bytes left in it twice. Keep the residue from the last
> +	 * completion in that case.
> +	 */
> +	hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
> +	lo_new = readl_relaxed(dch->base + CH_LINKADDR);
> +	if (hi_new != linkaddrhi || lo_new != linkaddr)
> +		return dch->residue;
> +
> +	for (i = cmd + 1; i < desc->ncmds; i++)
> +		residue += desc->cmd_len[i];
> +
> +	return residue;
> +}
> +
>  static int d350_terminate_all(struct dma_chan *chan)
>  {
>  	struct d350_chan *dch = to_d350_chan(chan);
> @@ -351,8 +938,8 @@ static int d350_terminate_all(struct dma_chan *chan)
>  		if (dch->status != DMA_ERROR)
>  			vchan_terminate_vdesc(&dch->desc->vd);
>  		dch->desc = NULL;
> -		dch->status = DMA_COMPLETE;
>  	}
> +	dch->status = DMA_COMPLETE;
>  	vchan_get_all_descriptors(&dch->vc, &list);
>  	list_splice_tail(&list, &dch->vc.desc_terminated);
>  	spin_unlock_irqrestore(&dch->vc.lock, flags);
> @@ -360,16 +947,115 @@ static int d350_terminate_all(struct dma_chan *chan)
>  	return 0;
>  }
>
> +static int d350_wait_for_stop(struct d350_chan *dch)
> +{
> +	u32 cmd;
> +	int ret;
> +
> +	/* STOPCMD clears only after the channel has stopped using commands. */
> +	ret = readl_poll_timeout(dch->base + CH_CMD, cmd,
> +				 !(cmd & CH_CMD_STOP), 10,
> +				 D350_STOP_TIMEOUT_US);
> +	if (ret)
> +		dev_warn(dch->vc.chan.device->dev,
> +			 "channel %d failed to stop\n", dch->vc.chan.chan_id);
> +
> +	return ret;
> +}
> +
>  static void d350_synchronize(struct dma_chan *chan)
>  {
>  	struct d350_chan *dch = to_d350_chan(chan);
>
> +	/* A stop timeout must not skip IRQ or callback synchronization. */
> +	d350_wait_for_stop(dch);
> +	synchronize_irq(dch->irq);

fix use sperate patch

>  	vchan_synchronize(&dch->vc);
>  }
>
>  static u32 d350_desc_bytes(struct d350_desc *desc)
>  {
> -	return ((u32)desc->xsizehi << 16 | desc->xsize) << desc->tsz;
> +	return desc->bytes;
> +}
> +
> +static u32 d350_get_cyclic_residue(struct d350_chan *dch)
> +{
> +	struct d350_desc *desc = dch->desc;
> +	size_t period;
> +	size_t next;
> +	u32 linkaddr;
> +	u32 linkaddrhi;
> +	u32 xsize;
> +	u32 xsizehi;
> +	u32 hi_new;
> +	u32 lo_new;
> +	u64 next_cmd;
> +	u64 remaining;
> +	int retries = 3;
> +
> +	/*
> +	 * Locate the current period from the next command's address rather than
> +	 * counting interrupts, since multiple period completions may share a
> +	 * pending DONE interrupt.
> +	 */
> +	do {
> +		linkaddrhi = readl_relaxed(dch->base + CH_LINKADDRHI);
> +		linkaddr = readl_relaxed(dch->base + CH_LINKADDR);
> +		hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
> +		if (linkaddrhi != hi_new)
> +			continue;
> +
> +		xsizehi = readl_relaxed(dch->base + CH_XSIZEHI);
> +		xsize = readl_relaxed(dch->base + CH_XSIZE);
> +		hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
> +		if (xsizehi != hi_new)
> +			continue;
> +
> +		/* Retry if the link changed while reading the remaining size. */
> +		lo_new = readl_relaxed(dch->base + CH_LINKADDR);
> +		hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
> +		if (linkaddrhi != hi_new || linkaddr != lo_new)
> +			continue;
> +
> +		next_cmd = (linkaddr & ~CH_LINKADDR_EN) |
> +			   ((u64)linkaddrhi << 32);
> +		for (next = 0; next < desc->periods; next++)
> +			if (next_cmd == desc->cmds[next].dma)
> +				break;
> +		if (next == desc->periods)
> +			continue;
> +
> +		remaining = FIELD_GET(CH_XY_DES, xsize) |
> +			    ((u64)FIELD_GET(CH_XY_DES, xsizehi) << 16);
> +		remaining <<= desc->tsz;
> +		if (remaining > desc->period_len)
> +			continue;
> +
> +		period = next ? next - 1 : desc->periods - 1;
> +		return desc->bytes - (period + 1) * desc->period_len + remaining;
> +	} while (--retries);
> +
> +	return dch->residue;
> +}
> +
> +static u32 d350_get_active_residue(struct d350_chan *dch)
> +{
> +	if (dch->desc->cyclic)
> +		return d350_get_cyclic_residue(dch);
> +
> +	return d350_get_sg_residue(dch);
> +}
> +
> +static struct virt_dma_desc *d350_find_queued_desc(struct d350_chan *dch,
> +						   dma_cookie_t cookie)
> +{
> +	struct virt_dma_desc *vd;
> +
> +	list_for_each_entry(vd, &dch->vc.desc_submitted, node)
> +		if (vd->tx.cookie == cookie)
> +			return vd;
> +
> +	return vchan_find_desc(&dch->vc, cookie);
>  }
>
>  static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
> @@ -387,13 +1073,16 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
>  	if (cookie == dch->cookie) {
>  		status = dch->status;
>  		if (status == DMA_IN_PROGRESS || status == DMA_PAUSED)
> -			dch->residue = d350_get_residue(dch);
> +			dch->residue = d350_get_active_residue(dch);
>  		residue = dch->residue;
> -	} else if ((vd = vchan_find_desc(&dch->vc, cookie))) {
> -		residue = d350_desc_bytes(to_d350_desc(vd));
> -	} else if (status == DMA_IN_PROGRESS) {
> -		/* Somebody else terminated it? */
> -		status = DMA_ERROR;
> +	} else {
> +		vd = d350_find_queued_desc(dch, cookie);
> +		if (vd) {
> +			residue = d350_desc_bytes(to_d350_desc(vd));
> +		} else if (status == DMA_IN_PROGRESS) {
> +			/* Somebody else terminated it? */
> +			status = DMA_ERROR;
> +		}
>  	}
>  	spin_unlock_irqrestore(&dch->vc.lock, flags);
>
> @@ -405,6 +1094,10 @@ static void d350_start_next(struct d350_chan *dch)
>  {
>  	u32 hdr, *reg;
>
> +	/* Preserve the failed cookie's status until the channel is terminated. */
> +	if (dch->status == DMA_ERROR)
> +		return;
> +

this kind of fix need use sperate patch

>  	dch->desc = to_d350_desc(vchan_next_desc(&dch->vc));
>  	if (!dch->desc)
>  		return;
> @@ -469,17 +1162,36 @@ static void d350_issue_pending(struct dma_chan *chan)
>  static irqreturn_t d350_irq(int irq, void *data)
>  {
>  	struct d350_chan *dch = data;
> -	struct device *dev = dch->vc.chan.device->dev;
> -	struct virt_dma_desc *vd = &dch->desc->vd;
> +	struct virt_dma_desc *vd;
> +	struct d350_desc *desc;
> +	u32 residue = 0;
>  	u32 ch_status;
> +	u32 irq_status;
> +	u32 errinfo = 0;
> +
> +	/* Keep the sampled status paired with the active descriptor. */
> +	spin_lock(&dch->vc.lock);

use scoped guard simplify lock code.

>
>  	ch_status = readl(dch->base + CH_STATUS);
> -	if (!ch_status)
> +	irq_status = ch_status & (CH_STAT_INTR_DONE | CH_STAT_INTR_ERR);

if it fix existing problem, use seperate patches.

> +	if (!irq_status) {
> +		spin_unlock(&dch->vc.lock);
>  		return IRQ_NONE;
> +	}
> +
> +	/* Clearing STAT_ERR also clears CH_ERRINFO. */
> +	if (irq_status & CH_STAT_INTR_ERR)
> +		errinfo = readl_relaxed(dch->base + CH_ERRINFO);
>
> -	if (ch_status & CH_STAT_INTR_ERR) {
> -		u32 errinfo = readl_relaxed(dch->base + CH_ERRINFO);
> +	writel_relaxed(ch_status & (CH_STAT_DONE | CH_STAT_ERR),

why previous check CH_STAT_INTR_DONE, here use CH_STAT_DONE, suppose it
is w1c register?

> +		       dch->base + CH_STATUS);
>
> +	desc = dch->desc;
> +	if (!desc)
> +		goto out;
> +
> +	vd = &desc->vd;
> +	if (irq_status & CH_STAT_INTR_ERR) {
>  		if (errinfo & (CH_ERRINFO_AXIRDPOISERR | CH_ERRINFO_AXIRDRESPERR))
>  			vd->tx_result.result = DMA_TRANS_READ_FAILED;
>  		else if (errinfo & CH_ERRINFO_AXIWRRESPERR)
> @@ -487,22 +1199,28 @@ static irqreturn_t d350_irq(int irq, void *data)
>  		else
>  			vd->tx_result.result = DMA_TRANS_ABORTED;
>
> -		vd->tx_result.residue = d350_get_residue(dch);
> -	} else if (!(ch_status & CH_STAT_INTR_DONE)) {
> -		dev_warn(dev, "Unexpected IRQ source? 0x%08x\n", ch_status);
> -	}
> -	writel_relaxed(ch_status, dch->base + CH_STATUS);
> -
> -	spin_lock(&dch->vc.lock);
> -	vchan_cookie_complete(vd);
> -	if (ch_status & CH_STAT_INTR_DONE) {
> -		dch->status = DMA_COMPLETE;
> -		dch->residue = 0;
> -		d350_start_next(dch);
> -	} else {
> +		residue = d350_get_active_residue(dch);
> +		vd->tx_result.residue = residue;
>  		dch->status = DMA_ERROR;
> -		dch->residue = vd->tx_result.residue;
> +		dch->residue = residue;
> +		dch->desc = NULL;
> +		if (desc->cyclic)
> +			vchan_terminate_vdesc(vd);
> +		else
> +			vchan_cookie_complete(vd);
> +	} else {
> +		if (desc->cyclic) {
> +			dch->residue = d350_get_cyclic_residue(dch);
> +			vchan_cyclic_callback(vd);
> +		} else {
> +			dch->status = DMA_COMPLETE;
> +			dch->residue = 0;
> +			dch->desc = NULL;
> +			vchan_cookie_complete(vd);
> +			d350_start_next(dch);
> +		}
>  	}
> +out:
>  	spin_unlock(&dch->vc.lock);
>
>  	return IRQ_HANDLED;
> @@ -522,10 +1240,20 @@ static int d350_alloc_chan_resources(struct dma_chan *chan)
>  static void d350_free_chan_resources(struct dma_chan *chan)
>  {
>  	struct d350_chan *dch = to_d350_chan(chan);
> +	unsigned long flags;
>
>  	writel_relaxed(0, dch->base + CH_INTREN);
> +	d350_terminate_all(chan);
> +	d350_wait_for_stop(dch);
> +
>  	free_irq(dch->irq, dch);
> +	vchan_synchronize(&dch->vc);

Use seperate patch to fix existing problem.

>  	vchan_free_chan_resources(&dch->vc);
> +
> +	spin_lock_irqsave(&dch->vc.lock, flags);
> +	dch->req = U32_MAX;
> +	memset(&dch->sconfig, 0, sizeof(dch->sconfig));
> +	spin_unlock_irqrestore(&dch->vc.lock, flags);
>  }
>
>  static int d350_probe(struct platform_device *pdev)
> @@ -553,7 +1281,9 @@ static int d350_probe(struct platform_device *pdev)
>  	dw = 1 << FIELD_GET(DMA_CFG_DATA_WIDTH, reg);
>  	aw = FIELD_GET(DMA_CFG_ADDR_WIDTH, reg) + 1;
>
> -	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(aw));
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(aw));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set DMA mask\n");

If seperate patch to fix it, can't mix this to new feature patch.

>  	coherent = device_get_dma_attr(dev) == DEV_DMA_COHERENT;
>
>  	dmac = devm_kzalloc(dev, struct_size(dmac, channels, nchan), GFP_KERNEL);
> @@ -561,6 +1291,11 @@ static int d350_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>
>  	dmac->nchan = nchan;
> +	dmac->cmd_pool = dmam_pool_create("dma350-cmd", dev,
> +					  D350_SLAVE_CMD_WORDS * sizeof(u32),
> +					  sizeof(u64), 0);
> +	if (!dmac->cmd_pool)
> +		return -ENOMEM;
>
>  	reg = readl_relaxed(base + DMAINFO + DMA_BUILDCFG1);
>  	dmac->nreq = FIELD_GET(DMA_CFG_NUM_TRIGGER_IN, reg);
> @@ -579,19 +1314,23 @@ static int d350_probe(struct platform_device *pdev)
>  	dmac->dma.device_free_chan_resources = d350_free_chan_resources;
>  	dma_cap_set(DMA_MEMCPY, dmac->dma.cap_mask);
>  	dmac->dma.device_prep_dma_memcpy = d350_prep_memcpy;
> +	dmac->dma.device_prep_slave_sg = d350_prep_slave_sg;
> +	dmac->dma.device_prep_dma_cyclic = d350_prep_dma_cyclic;
>  	dmac->dma.device_pause = d350_pause;
>  	dmac->dma.device_resume = d350_resume;
>  	dmac->dma.device_terminate_all = d350_terminate_all;
>  	dmac->dma.device_synchronize = d350_synchronize;
>  	dmac->dma.device_tx_status = d350_tx_status;
>  	dmac->dma.device_issue_pending = d350_issue_pending;
> +	dmac->dma.device_config = d350_config;
> +	dmac->dma.device_caps = d350_caps;

keep same pattern,  d350_device_config(), d350_device_caps()

>  	INIT_LIST_HEAD(&dmac->dma.channels);
>
>  	reg = readl_relaxed(base + DMANSECCTRL + NSEC_CTRL);
>  	writel_relaxed(reg | INTREN_ANYCHINTR_EN,
>  		       base + DMANSECCTRL + NSEC_CTRL);
>
> -	/* Would be nice to have per-channel caps for this... */
> +	/* Advertise memset only if every usable channel supports wrap. */
>  	memset = true;
>  	for (int i = 0; i < nchan; i++) {
>  		struct d350_chan *dch = &dmac->channels[i];
> @@ -623,8 +1362,18 @@ static int d350_probe(struct platform_device *pdev)
>  		reg |= FIELD_PREP(CH_LINK_MEMATTR, coherent ? MEMATTR_WB : MEMATTR_NC);
>  		writel_relaxed(reg, dch->base + CH_LINKATTR);
>
> +		dch->coherent = coherent;

Move this to prepare patch.

> +		/* Request line 0 is valid, so it cannot mean unconfigured. */
> +		dch->req = U32_MAX;
>  		dch->vc.desc_free = d350_desc_free;
>  		vchan_init(&dch->vc, &dmac->dma);
> +
> +		if (d350_slave_supported(dch)) {
> +			dma_cap_set(DMA_SLAVE, dmac->dma.cap_mask);
> +			dma_cap_set(DMA_CYCLIC, dmac->dma.cap_mask);
> +			dmac->dma.directions |= BIT(DMA_MEM_TO_DEV) |
> +						BIT(DMA_DEV_TO_MEM);
> +		}
>  	}
>
>  	if (memset) {
> @@ -638,6 +1387,16 @@ static int d350_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
>
> +	if (dev->of_node) {
> +		ret = of_dma_controller_register(dev->of_node, d350_of_xlate,
> +						 dmac);

use devm_of_dma_controller_register()

> +		if (ret) {
> +			dma_async_device_unregister(&dmac->dma);

use new patch convert dmaenginem_async_device_register() firstly.

Frank
> +			return dev_err_probe(dev, ret,
> +					     "Failed to register OF DMA controller\n");
> +		}
> +	}
> +
>  	return 0;
>  }
>
> @@ -645,6 +1404,8 @@ static void d350_remove(struct platform_device *pdev)
>  {
>  	struct d350 *dmac = platform_get_drvdata(pdev);
>
> +	if (pdev->dev.of_node)
> +		of_dma_controller_free(pdev->dev.of_node);
>  	dma_async_device_unregister(&dmac->dma);
>  }
>
> --
> 2.54.0
>
