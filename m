Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F0D48F015;
	Mon, 21 Sep 2026 16:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008763; cv=fail; b=qypbbQ2vleyrv/Ie/t0xTvi8i2XU6EQBq/KnxIp2WIWQce/D96SaKQFCOreM+HBjegs5ikiXjl4YlYF1gaxNiAXjxXpWTJBQmV+P+x36LnjZDuD6EFBVDbNXhuvsAnMxBmoEAvGa3UHcfi30wy6jr9M1R5PP7cry5QnDA0LepAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008763; c=relaxed/simple;
	bh=JzLnHoErcx3ipbarmZcJMedhJUXzOZBbYVIWq7aF/90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bqdQW0lmakXC8RwhWx9/Y6TNPwsILzW+s6g9bq2+rOL7SeeBPG6Cu3rN2+nndINP3t+4EjrUjuLfuyXIIErAR1hPBsSKosQmar11UMrTK7mrYIOP1PGNiUDV/W5U4wZx4umP8FNpqhzBP7WxTEnwCm9cCv9Asu+wbPjas1FYvII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H1ZDNEwi; arc=fail smtp.client-ip=40.107.130.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H1ZDNEwi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEcCuzb52hSMP8ch0sIjGrauEs/AIWUtSpMd3gB79NQzAiXARhbdMrwZZxwbzp//9YePgkXdXj9HJwkw5iKA5cmBJnRAdhGGnBcHbfVEqJdRQ1M4hLHdXFotf4jkP/qoIAZbvkYnE91OoRtkWmJIcc1sODiehZC1HAIj2vsRrpIze2bZhkhAjnjYe1QmyI9nMGajxBIRQS7wakQAXxOuV1Zf9ZxNIvBJ8NOMD7r9bq6A0lIYcNjpJ+HMJusam3pC4J/W3mCcCTd4WzWM3kFBrr83xBNteFAj0On2y521iXcu9ajF/mfK027yhHiQeb/Y9D+qIgra4m44ifo0ahvRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfNLZoOz+VlruEz1tiRRqlaIMfGWEUGjX0GsKWJXhaM=;
 b=WNg24j5/Toll3gNf4IecXpYxJuYhpHWsaWUTiNAWU+6XePW/AuxQsmLsjUBeWIIpWG2WTBVa7myNQgZss3pUYbPV0p9dLCxvOvlQty3wrHkhcjaX59i6P3fUF4Cxlwo6H1G0kmU8ZHbOFtM+OQbqxPHp7HRY5ShdrvyvNMt0TsZSk/f/6EF/dlUYrI76ILNeaykl2O6Z1sad8A4E0N+z8hr7a2ewBJQzJKIQVUG8xBNsWfBUCacVZCPiNhYDhDUMfEW6fEqtsgGrEv8mmu60+KoqyJjwWefgY07njHCCWChYO3Nou2Pd/nZq8Bqn63+n99TqUjXyvxBxiMt8RaNO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfNLZoOz+VlruEz1tiRRqlaIMfGWEUGjX0GsKWJXhaM=;
 b=H1ZDNEwiMZOMaH4ByYVqgNTHa3ZGcziszYuySQn8u9rFM5qKdvX/DvWQo5f8MqqiXLOMcHKdpcrggZusvEq2yAFLY0lT01/uLdN2hvmK+1EHMIKQjQwApkk+iYLs7P1Df3pr54uyvsmy/BxD6G6ldhrccmVtQsGcL0QJpbB6dM9cOAyfzVqdCz4Hg3xhN2ooCyqc6XMWik9BV2AlvYZR9Qmu8iB8nwSQc66fW0NL2DarvT7Ek2PVPOXkEG9cq+tzxKi85/EwLB9biIpOrGzRrp9ly7YAlk5f7ZZlcYXCk9ebcqRwjxcCW9LoBUWkAVXTcFuI8F1pmuOz3Qtsfy8BRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB11717.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:39:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:39:19 +0000
Date: Mon, 21 Sep 2026 11:39:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 01/23] dmaengine: ste_dma40: Fix physical cyclic
 capability
Message-ID: <arFdsP-buVyP65ue@SMW015318>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-1-5c55cd7f92f9@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-dma40-fixes-v5-1-5c55cd7f92f9@kernel.org>
X-ClientProxiedBy: CY8PR12CA0061.namprd12.prod.outlook.com
 (2603:10b6:930:4c::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB11717:EE_
X-MS-Office365-Filtering-Correlation-Id: a4039f24-8f3a-4f4f-0b1a-08df17fee254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HMVe1ODCCbbZ1wXADyi8RlMYriTxkiN/PyVltXDCrMLJLDQVzsJCTZ/rtBQ6+o7Hi5SVwYLzpd1Iq9NEGnQYed4piCx6x4/vtqeKGMPF8mtw8k5zLWFqeg1ShMw4xofjQ3RJ+PAGlNlMKZtCcRReqJwUK5WU8do2wn54TcO10WeUqexEEK8NdGnHxKgnkiX/W+UvOGhsQJInhC20sUyeLx5ReuJgrV+ektRyzBCL4v/U2M8CCECm67c5ediOlNoEPHv97udEZeNbh+YlpRc8+advnl1KJL4ahMsUuqcNNah5dEBjfro3pKgXOM2rJEO0cR2FgsXsEe2dpYDSEW96evRSyqnHwvsloeBx9px/mGAkhlfTHNe7YFCR+XBFtR8rWeGcuwK8cXu1iNZW3hk8lv+/TOMAzMTv2uCUZ5ogPPKC9tYO/R5k9SG8DHt3cJGh8bbijFRhZ+vag/IVJw49AIX4QItTMBdGL4YI2Rmk5U+GTaktjY3fQeC11DdbzMJWeAeydYiLQUbeYoqTCcyjsaxmbgm9O8c5wCsLZYlVMwPtMzdYRpDHnU4yZq+/FNN9dUvSWBJlDr9AHIL7c0WBHLp28XwNpt2QuWxx2ZHKpow0QrMKeW7vnJKc8ZxvnbJn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0nMzWPrYWwhhjp9Jn24qeGQjXnV9UDYlAd2Q39EwZCHKxdSIJqsVuqzSPeBF?=
 =?us-ascii?Q?uUZ+MHNIcXzVwGO/RmQ/2JAT9SgC6LlOieMpnZdX+G4guX+aGOq8UY6Btlo+?=
 =?us-ascii?Q?+G0KFoN5FM5nZneKSYzVRIyAAy0veypkcZbBYt4Z0+3e/exPVZcUN3fSo+b+?=
 =?us-ascii?Q?F02SoIXvNWrQoBNvaPF6C5OKuKyvH6KvbHiYY9v/2z7AMz/UJZGsgNSk/IW7?=
 =?us-ascii?Q?gpi0kUdNGusfP3TrCa8HQKkWSkki7EFWQkEmP7f1jULbFh0WOr0aAWs/W13e?=
 =?us-ascii?Q?JUavvlTvYrvFyJlcyZ/F+huRzIL6G96RRlCsQ5F6n4CDczg4LnVUMICMz2yE?=
 =?us-ascii?Q?h2uXRIgQLmwOhpAymkOwKhm6jJoEWz3GmPRISRIRzGDw91ICktQwHLxuSssZ?=
 =?us-ascii?Q?gizYwtULLvfK8enJ/u+cUWEivYmL6FDZX0XwwBLCMpPMP9s111SAk2io2x4D?=
 =?us-ascii?Q?QZnYLZX2CyvwD0vYN3+W/9BT5s/ZQQ6YAXbw0livUGXnC1XcVjR9UMNTeJZd?=
 =?us-ascii?Q?x7nGfD97cc2QDRBVLbpKyadAdp4Ektdc9/A1zglY5fJKf28SFOcoea4OB438?=
 =?us-ascii?Q?Xj26DlvQXWu1ZRH+ooyya5OWojRcUHE8LQsXJKxcJFIr5f+hbr4t7TOkDBzk?=
 =?us-ascii?Q?1vMjCZ3mX2HWLMkey30Vqz4kG25DYEi+pQFYoJKTtwGqzhuM2uxc8vAcDj2R?=
 =?us-ascii?Q?/wNKMXxJKDuwk96UGUB7YUR3VR6qv0RE4VYW6mKdPgjHT21HiRUP91RPCRdD?=
 =?us-ascii?Q?mU2krapr+sYjd+TDI42po3VqlLOZNg1ypRGsOhs3Xlyvzgz2N1ZMBxwtQqYg?=
 =?us-ascii?Q?t/oc0VqPbMl3AQcpXPrFmmsjEboXe7ByhPSCYu+R5MKsdkhJqSI84qpqAG0J?=
 =?us-ascii?Q?kfacX5/d0PlIHbV5VfYL7u8HMxSl6pk36kVx8FZZMjDmSQzLFat70StU916W?=
 =?us-ascii?Q?yYHTGK9tVQ1LI+C/D8zYKdiL6DCJqGMGWTGiIuTZUTyq6BK8nVSoHpCUVVXt?=
 =?us-ascii?Q?CqkQbd9csA7DPh6FQN6UlrQAIXYjNwyLEjqRRLV6Rrcu7n66muZ7MNWYShCU?=
 =?us-ascii?Q?tkhYMQmrarHsCpnbtCycD76eB3KUXMF7zCr8jHGHz6sDFJI1AwAo2VM5SPAc?=
 =?us-ascii?Q?Xscou9hfRO/hlHYZvZ5E5WbdzmD0YUKOmkE6SlqBxm8t+llxnNkAxlwNnuRW?=
 =?us-ascii?Q?9f55fFGgYxlS2zOViV1+ASqckfLFR0U68lMAzfRzkK4WkbgmhcPciZBUgDL/?=
 =?us-ascii?Q?1+gwuwb3DisTMM3WxjP80sHeGmXGNw9ydvBlLpuhkGwZjpn7xcWRlVZBNPEV?=
 =?us-ascii?Q?5rRQ/hLe9kh2lBCaEDoNqyI1STZ4mRXviGQ1Ud0eW6aZ2EgK8AHlzkrVqVkL?=
 =?us-ascii?Q?hGuZLlecxoSxR72x7wdJHMGiz7A4n/6c2ncMoyFyyxfZUylXno98qIkmhNHD?=
 =?us-ascii?Q?lagsssYmY0G0nSznzS6PFe986Ws9Yu9Sb/yaIaeKkGxpvU0rfyMYccUw7D0E?=
 =?us-ascii?Q?PP5/YYFqi3dMyTOjmohZA7TUblnTkE5W5jaTuobrsVkl8eJnvg4MYebkfq8L?=
 =?us-ascii?Q?hVsoi/nySwETnMOI+y6hOPvliKf68KsE65iq9a/C9VkmwTkwOSU9dg67brPW?=
 =?us-ascii?Q?E43jQFOYYT2qubcqr/ziOlhzvgnp7IatJCZU5BOGoBJMwdKS5lmlnFBMToDf?=
 =?us-ascii?Q?7tbybpFr/k3uEnldTxhXIGZPZQREEwU2YU0obxeoe6ZxGaY4vekGI4zjK+1h?=
 =?us-ascii?Q?SM2Cmf2X1vm7iFvFvYaVGBIVMvUEaqCi3c3BX3YMDdaeOujVdXSN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4039f24-8f3a-4f4f-0b1a-08df17fee254
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:39:19.9208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BE5Xgw43+i8jA/J1m0cntqlRrN9umTvy16W1e7yMo3tpFPgINIU89ihwLGySCGba+QmLMldJPt9BT/wTgQ+uzshF8SAEeMntdPWgE2Vkc1rX5U5dej4q13ZrrAD7cY28
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11717

On Sun, Sep 20, 2026 at 08:59:36PM +0200, Linus Walleij wrote:
> d40_dmaengine_init() configures dma_both for physical channels that can
> handle both slave and memcpy transfers. Physical DMA40 channel setup has
> supported cyclic LLIs since cyclic transfer support was added, but the
> DMA_CYCLIC capability is set on dma_slave a second time instead of
> dma_both.
>
> Set DMA_CYCLIC on dma_both so d40_ops_init() installs
> device_prep_dma_cyclic and physical channels advertise cyclic support.
>
> Fixes: 0c842b551063 ("dma40: cyclic xfer support")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Missed my review by tags at v3
https://lore.kernel.org/all/aq2XrwzJDF8yZCbz@SMW015318/

Reviewed-by: Frank Li <Frank.Li@nxp.com>


>  drivers/dma/ste_dma40.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 0d9ffa3e2663..e4d689c9eba8 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -2897,7 +2897,7 @@ static int __init d40_dmaengine_init(struct d40_base *base,
>  	dma_cap_zero(base->dma_both.cap_mask);
>  	dma_cap_set(DMA_SLAVE, base->dma_both.cap_mask);
>  	dma_cap_set(DMA_MEMCPY, base->dma_both.cap_mask);
> -	dma_cap_set(DMA_CYCLIC, base->dma_slave.cap_mask);
> +	dma_cap_set(DMA_CYCLIC, base->dma_both.cap_mask);
>
>  	d40_ops_init(base, &base->dma_both);
>  	err = dmaenginem_async_device_register(&base->dma_both);
>
> --
> 2.55.0
>
