Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794862513;
	b=k17zW4BT4LsqLl0O66/v399P6bzhB4r7w/vhhJXfNCDcrZ5mLxPsK9QR9V3VBe+slKeM
	 FAaiDylQA2eolpF7hA7L5q4Z7kUp8bDs5dlC2zTBWNahZgTTakBJGttb3c1vEbsnWKCNy
	 W4oLxCQvJp2zYE92wkRxJtnaGfTpu+IE40c6SX1cBlDa0c4uknTwpJ68IdtZACcHM1JES
	 ZfkESwWsK2O/7EMTaPiooQsRA6RahX/NATOsqlajn8ErlX9kLEaP01Nb96ACKcy75vu8R
	 eZrhlFrDMv5la0ytpsOv8CmRlgJDH7TPY90zJ4v7Xgw2ZY90+55Pi/qDBd4Ejt777KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862513;
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
	bh=TjIsWV06Lvv6CCEOimW5LdN+4Lo5WezLZGah5DkK4h4=;
	b=LqmQudelvRVrWbtUZVTIjmAK73PKp52JkLNDE6uDqVeQWkN2mDAs9RGLicpQyWHJyPXP
	 kFBkngpfxTiGH4QXYuoFQwCvFOh1F7hwNC7TBnVF+7SfsUj9t1S2S6/9i8WJMRHly2CFy
	 IZjekaqo9fFP2JU9YBtMjf6jdNiaEqguhztmgsYxrN0UJGeVXmP6Fm5bTYH1C15G0U4A5
	 vmKUCAb6Y7E+ymJpt133sVS5Hx+Y5BK0PhijH/ip50Pvw9v3tOA63M8eWjvlgLwS6UXze
	 kkbuwcFUxC+H52kYgiWg/Cy1rp5Mp4HlcUCcQt0UIvrGSG4vNx3B4SYhwSQlwt5g7Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EmRfI1Fx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.4
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013004.outbound.protection.outlook.com [40.107.162.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C21606A31C;
	Mon, 16 Nov 2026 20:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43C21606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EmRfI1Fx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGSjVKVW+kY4SW7awQabklQrUs1+X4NaZgji3ctcs+RsCISmnf7+eZXyKLaNS3Y9heuv3GWoJGFyTlORRGkoTT2zW8lkMQQqu0m4NTI748VQGBprA95DH1FCRwWPFKVqmibf5KcySvZQBlihFEeitn0dvqB+Qu0t6D7D217NjQ09UPepUiYUMC4yhfVP3FpQ1eNllwsMjDn06FFL03Bdws593K8Fx0QkarpNgsKSpVYDB6dME8BM6YkV6MRaFaftawq7kdMpFZJGdhZHv/PUAHpoBvyFbDvDe80gfLm4GqvP+nvYrMct4I6knD+5AlL+WU84i/krBWCKErSKAr4z4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjIsWV06Lvv6CCEOimW5LdN+4Lo5WezLZGah5DkK4h4=;
 b=IZ+Jq9FaoTnFYATf4LSEm0I07RiD76uh2GBfSGwXsAR8BcLK/RWgtA+QLtHisYrnlWn/EX6wnz4S/W6Q903WIY4CTvoVgj5ttD6fuV0OTHL7Bf9ROeNxMGFcgMz0cbir1eensDdjHZcH5j5/HKY5a1DNJq/jlrj2B1hLgWfy1Ny+78M/tUogt0p8RqDPkDG6DeZONV479JF/BDDurc+ZxDkfF8gvEYOPXfs2RihnKW7Ri7vCZqtOIaTzhKCy+ZlOVRwrTrdCSOtO128+SWJRY44jbv9OwPxMBANZb/nE/Oj58On81qgxB6XdclylkJ4ClA4fBVVdmJ26uE9Sd5aCYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjIsWV06Lvv6CCEOimW5LdN+4Lo5WezLZGah5DkK4h4=;
 b=EmRfI1FxMKsCrCTS2rxyZA3ZDg1FHq45n5vAxoWr2y+kccu64jFu7R1nI39eTwsxg8WYNK9ZkTUUEdSo3BPGEw1wmta1U5dMAMAYDBh29+JcWCBKWvMChkE+f10lF1ESdTH0MdfEC0NEf2mEpOmlJl/tmH3KWtQrpba/4LCEzw2swdCpdYYy0xAJaAe5VUX184QZ7iJCqiRJlpuZcCiBql843iBC+E5Mfonj6aIW9dx157DaQcv3EQ/qBbAPbh7Uz9WaYj3ad0VeJkBTXB+9jH1FETCbfiiZYmrCBQmopvFdVJGEsbpYbiJCgsqYxrE7G9pWp0ksrF3Sl8j62yUyVw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM7PR04MB6887.eurprd04.prod.outlook.com (2603:10a6:20b:10a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:55:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:55:09 +0000
Date: Mon, 16 Nov 2026 14:54:59 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: okaya@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org,
	andy.shevchenko@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: hidma: avoid world-writable channel
 sysfs files
Message-ID: <avttox8HeQaTAJdr@SMW015318>
References: <20261107221500.96825-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107221500.96825-1-dennylin0707@gmail.com>
X-ClientProxiedBy: PH7PR17CA0059.namprd17.prod.outlook.com
 (2603:10b6:510:325::25) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM7PR04MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: d37a0384-abad-4ad9-8460-08df4423e673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|18002099003|22082099003|261009223027099003|3023799007|11063799006|56012099006|261028144727099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|261021123027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/VXwYFEoCEGaAwUdBzuaKaAy54i07ztkoV8xpq6RpjQNYjBxNwGcybxC8zpUVdJjRRHAdQs8aZ/WgKEhC6LrvAF2IBHC7xFgYgLmpw1goWVNrdwtFnCdJ//7gYwwOPtrv9i7MxsgUnFIqqky+gYy8YIdoQxrNENBKzdZqegLq5VIHrSYMjz7Fn2TgKxuuXGFvIv+Cp2CfdtHfQcL/u/TffQnq9jeTW6PK+a/GYgXskoH6E44r0Ie/MDumJ/T+gJEEr5ICDm9/T8FATzcs8rCDoUK4b7meE4IWhQY2nUI1qWGQ0Juhc3uAzGfmctCz8gpeI+7XJ5zSfYUlb5ML6Y7y2fxffLYuZc6BZoac+Y0TOF8xOBasNS6O07qeR1rSK3ThTnyeLPk8I9CM1/sqpTPtdZh8bKjclJNxpztCarzjlMTDcGGv3ButScW75kWHA1sbm5GnRBbo9LtxxQrAeyvIOgKrgEL7/jFkxKwk6FXxVz0+wpPiK0M5xYvWZ2buCtpKUBMKU1jCWHtJ5LcGlYYOACP6FqDCcreYF1LyNR6nbgVkHJnI12Z+l3LwNmsiHJrXgwbkDxp3igzxiQi4aH9vQUQRLrEbC4B1Y/9r8S/q5jV/SVSEU40R6LrKOsbb0G0HOjFoPYV7tzD4k9+2Bft3TpaP7SxSD6baJm9efx5xfQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(18002099003)(22082099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261028144727099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(261021123027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OoZazzGqrGUBMD27k64EncIDX8+fklFtgR2VfDZ6Yn+L351BW5JQIZ/1h/oX?=
 =?us-ascii?Q?eOXRe2TNxkpLNBLGVfDgHGK5R8jJjn+WxFfwr4T1gZGENfoLYHm0m4jvcFdN?=
 =?us-ascii?Q?0DZ74HRn+Do14sNPzDjMtoJuf+zSxzKVZIrPvWAL4KQ8t5ziOSQY7tcRqVfK?=
 =?us-ascii?Q?S35/UCUaJzxB9+f16alglW9j4zH+AXJ5ZnQsGjsrKvN+1LQOjFZJTFxGksDe?=
 =?us-ascii?Q?Xn+b45JDjpmWumEjptaznTyEOm0LFBSOk4z0AliRMYRnBb9QqISi6MHGNMFd?=
 =?us-ascii?Q?ozti2l5T3M/wxhuNxUWQADRDIWiY3SMXn1R5KRMVbfxS5dQYDA7c6X7pjAB6?=
 =?us-ascii?Q?c0HC8C3aC1+5y/gIleci6lSJK9GS+pNTNEu5gaJ37SsVtcraHdLVMSuqcnG2?=
 =?us-ascii?Q?FVZQUBGJo3YIWoqoKJcjkXiOrUdjlccarp3rewyGWcmUCc+PaCYLE69BChbB?=
 =?us-ascii?Q?zCsV5WTpWMjMHK2Nx7VTFAIKTnZUM7RdyEpSSqPOPCARQOr5Qie2WS53mifh?=
 =?us-ascii?Q?K2WojS6d3CVYAoOiVQ4wL1CZ3/uhJXBStlMxNBIcIloK0/VnC5K1sX3sbRaB?=
 =?us-ascii?Q?GFvNRajZ81AVHkgeVIXNLG/LFj0B12DSZDXCqW9t+iq8e7HbjVO4KPeyRYXq?=
 =?us-ascii?Q?4kpLIxqCupsY2EB9x3HAAm0WwlS1TQKVia9MUuBRbIGEbKpPFeTohLcthLhx?=
 =?us-ascii?Q?orwsUwUGoxc9IPqBLOO7ZMphGzRTUQ9V53U3469+M1YIeA5A+VaEA29m0A+7?=
 =?us-ascii?Q?bKFBnXyKUsS3ZV3nRU1chpcBUpRBOpzVhi5qZJ4NYpx5sW+7wu5iw/sqpqVl?=
 =?us-ascii?Q?svjzWRItw+QXd7wUhdXJcNJaVolk/MNM5crf6Ly+kf847K+3V20j/c0V+ype?=
 =?us-ascii?Q?qbnHNoA6FDfdIjQ5c8SUWB/WI631H8GkxoxtPNx1usVvcuTC38WUgjs3pBe2?=
 =?us-ascii?Q?qP0dhy7iimIT7uwa5lVRdq0D3+U83g1wsjwHemhecYEJlWhxlLbakRnj/qSX?=
 =?us-ascii?Q?BlzbOIq1tut0DGeQNxpbpL9nneXFtw8GSM+nV4TKXjn505UwbktZu6k+UhwF?=
 =?us-ascii?Q?9P+m1x/ClQrTaRgb0qpTvFMstftE0bg0MbmMgryfyoHp8eohsfbpLN+I+FLs?=
 =?us-ascii?Q?x1e1uyPKMqsN+3aLyP96zTutsYgG9b0vtEdn5oLcBaQLtXiOkfhmwBnaKHqY?=
 =?us-ascii?Q?Q/DaRcg6e/Nj6yFvP3r6uwSjdWvjhEPntNtG7MqGk5Nf62VVNdLDXD2WSbdh?=
 =?us-ascii?Q?iPHJBWLFFx+uf8LXDPyooAW9zC/mCX7ktfCMXrot3YYOBXQVelR+OZr7SLXe?=
 =?us-ascii?Q?rjfu8ScncokAkPt+smTzbgr8x0lx3h7Lpz/QBsQEzSTMu70VPM5cDzLZczBq?=
 =?us-ascii?Q?78By/CAKXfy/Nhmf5vo5R0voNEzUuRsbFTD878NeVAYPr5QaOGbNOU0Fg6Lq?=
 =?us-ascii?Q?1VhuXJ+HV4kVjalGC4mfeLPx1alVY6j810Thzz1tMnB+j93iUKFw8qHULi1l?=
 =?us-ascii?Q?9IhZDHuoZXBYwAJnsxYixJK6OjG5VU232DKrV0tAXan491BsXvg0w7yHndRx?=
 =?us-ascii?Q?5pRdNP0+f8YnFMXhQGrK0dOh9li+6EQokomsFoQA2uejBsVXEW3Ncej95gA8?=
 =?us-ascii?Q?4y58+vajsA9NTLsoNS3rVG8HYFx6EAC60Y/QOpCSnSWZqt3iSiPm1JOrr5vk?=
 =?us-ascii?Q?nIGolrfND0/PeaNWvejO48K51gI54yqOt2sDJC/c0wRlWBjC8ZPQph4UMOyP?=
 =?us-ascii?Q?/jTZ9V4LjFuwIKzEtl3WLrMXzApyRN/KnUiGAHahSUC7J/yj2j4A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37a0384-abad-4ad9-8460-08df4423e673
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:55:09.2761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0R0cAxaiqLrd1FdQUeg3isEMYkTgGsHLDQkgxBmvyxA9DiBeQFnu7tvsf4BkpJjeGgMAkiET/SSq/iq7HcctmTaYzUO+gfoAfvUUoPDBCElYA096eH8wjuKteN5Cd/Q1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6887

On Sat, Nov 07, 2026 at 10:15:00PM +0000, Hungyu Lin wrote:
> [You don't often get email from dennylin0707@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> hidma_mgmt_init_sys() creates the per-channel priority and weight
> attributes with S_IRUGO | S_IWUGO, so any local user can write them.
> A write stores the new value and calls hidma_mgmt_setup(), which
> programs it into the channel's QoS register.
>
> Attributes declared with __ATTR() are checked at build time by
> VERIFY_OCTAL_PERMISSIONS(), which rejects world-writable modes. These
> two are created at runtime with a mode passed to
> create_sysfs_entry_channel(), so the check does not reach them.
>
> Make them writable by the owner only, the 0644 that __ATTR_RW() uses.
>
> Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/qcom/hidma_mgmt_sys.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
> index 9672ef9ee8fc..53b991752e80 100644
> --- a/drivers/dma/qcom/hidma_mgmt_sys.c
> +++ b/drivers/dma/qcom/hidma_mgmt_sys.c
> @@ -265,13 +265,13 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
>         /* populate parameters that are per channel */
>         for (i = 0; i < mdev->dma_channels; i++) {
>                 rc = create_sysfs_entry_channel(mdev, "priority",
> -                                               (S_IRUGO | S_IWUGO), i,
> +                                               0644, i,
>                                                 mdev->chroots[i]);
>                 if (rc)
>                         return rc;
>
>                 rc = create_sysfs_entry_channel(mdev, "weight",
> -                                               (S_IRUGO | S_IWUGO), i,
> +                                               0644, i,
>                                                 mdev->chroots[i]);
>                 if (rc)
>                         return rc;
> --
> 2.43.0
