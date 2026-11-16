Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.162.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794865225;
	b=PG8fd0XJurzv1G9jc0l/4F+CVIpet3FcfN8PVF/UkqE7uh7rcYg/KLJHhKBhW+7AAJ94
	 LBEPpmU5EMYaYmUdV9y2lhsatm6YsNQ9Yw8mD48S5prpG01eEsiNzhZevBcAGMCgjqT/F
	 zZd8wXwoUWM1G4Jjh1ZZdz0x2dGRGzz7Dotkto+04F/ddxxheIMS+YCundJ+wE41sXBEK
	 ntYcuiIsayLl7xwgon2qvC4R03KRDIEQgpqgBWADI99iZz+eF3yD1x9lsT8g9wrXLmjIW
	 GT4+FBbvrvrcw/gjayIuyYsVIys97G0pu1KXhX3gvNCnZmN2dd/0SvBy3XiwY1AdoIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865225;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NEqR5F+6rhUtd1TxER1Hgq6r45/JKSGFY9+RnpfuTPY=;
	b=dKHKkjbxlkU3xX3Ot40D9ntQhYfXemZ+IbqWvX8ft8Vxry7Qkg+lx/V2aWF3l/I0uOqG
	 0FcdXocc+l7BnJibXobd3FR7W+HfPZRYT/nnkZdgBQM9uyjNqC4F0Fkjl2OjFNyYF7Qi7
	 l8ljnBck0dHbRcZUfCROgFYY/RkWNNffQfHV4dNn99n3LrSvuOAxJPRgh4Jyjscj+mi/H
	 EkvZi7Vw1hca8dUu3WNA8HmAzKD+174e2ZOvygpBMIyWAEha8d3UvVAUk7OVpL+vk5vYa
	 ukisPBRkgcPCmmPpo1kP/8lwrgp9I9F1y+4jrVBHH6xW/V0kd73VK2VrihFAo2Lpj4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CxH9QYay;
	arc=fail smtp.remote-ip=40.107.162.51
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF5606A33F
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 21:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6CF5606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CxH9QYay
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5/rsdM6ZQQgXojrNYpTaHHXUdBx1EWz3Ew75d4PkUXrr/Wt272TD8TKj2UX7uMOchdCiGj3F/e0brJqx2w00C98hYYlajV9ycsZTdZduI3VbivJ2SWEjvFSvIraZzSAHeUmccyB2EOKM1RqHiSRZUPCN2wNTEFQVKRydqukd9BPQz/XtyxK0AaUAJ1anbZwNa8qQZl73txZG0v05xw9cy6odqtMLWtC2LpjG9QIZovUC0Hbg++RPzBjGkCZd3tqtC2xKSO+X1pdapbcdjPubOv4VFiXtO7oEaD6jdFmV3ZJaRvUnBkLIgzAMgeqzbtgvOPFhAP4/8DDBkpX6SZStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDZeuk87OtOt1VstirK5RKgTiukh98+GPhQZ6qo+F50=;
 b=CtXXBq8S8KLDBQrXFVEAl1mjZ7e1ArDOzZrPczB8P/hB7IQki1whkeg8/7rNcJ3cMEUx+88Qb39/Xgku4iPRO30dTLXp1LIOv6DTkKi6mkBnU8WBzne6+k4qG5tVrAld2wpH2DJkbztJk5igWFTPezpfI4LQlShmO/Vq2gaQTxTA+AqTQh4cPkVbrkaxtJEGsm+orl1u7XlmZvTnWVBAZ3iHfY66r7azQR4UDBY/Oy0q4HVzxC0VN+ApwQFozA2c3H7d4+57IlD5CtWLCrj1vbcWeueimCW7AQIE1JDhzUnCRr0ZvJkJTN59svC8iINGRUzeEQsV7ILyYBfLIh3/GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDZeuk87OtOt1VstirK5RKgTiukh98+GPhQZ6qo+F50=;
 b=CxH9QYayJEV3rKl0H7Rk5xfvbpnGV7bcSepjMC6fmDxgXerVvPZYQXcYARIWwYhuRvpHLsOdxoYYPLpa74DAC1JCuUtHOTdrIO4JruBspLK5EpGjG9nIRu0HcYIuFr11sEfRnFeF5KETwYSPERM3A3AkvRlDtUasdo5T1XmIZOyCv6KyT8nERgbU/9TokCWnco1FLBcVpU36Sk2PV/xP5T9zyMsB71QI3m6tOdWjEcUQzFVVLMP7AhCSGRe5RKrt9F8gWYebACkiCzlVKCRjkgb4CCw6kIlyOql8qE8nHJxfqj/HCdj5C7ojvJ3o+Y+jakt5sGk5frZn1ER8ATCIxA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10378.eurprd04.prod.outlook.com (2603:10a6:150:1d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 21:40:22 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 21:40:22 +0000
Date: Mon, 16 Nov 2026 15:40:13 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Allen Pais <allen.lkml@gmail.com>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v4 02/33] dmaengine: back channel BH helpers with WQ_BH
Message-ID: <avt4PU04jy8a4e_i@SMW015318>
References: <cover.1794315350.git.allen.lkml@gmail.com>
 <717bb0b82658f1dd800f6b1bc06b9cf283f77361.1794315350.git.allen.lkml@gmail.com>
 <sashiko-outbox-207180@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-207180@kernel.org>
X-ClientProxiedBy: PH8P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: 69141105-4230-4548-bc0d-08df442a376e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|18002099003|22082099003|6133799003|11063799006|4143699003|56012099006|260925022911599003|260925021311599003|260925021911599003|261009221727099003|261026121527099003|261026140227099003|261102130727099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261009223027099003|261028144727099003|261009223327099003|261009221227099003|261009220027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nzF4CwKy1AwENDmuEYCOmkx+U83sLnffeypoCwngivajsci7Ed0e2fcR6HnUO/UMh4C1/jUkYNQUo5QbFyDNBCL/Hbvghowg5+BkqNziIzESCsan0Y7CFmztAaVvUOKGsN2VyioYMeYDmBGijRrmdSI9G43tO5TzE3pw51HRvBsh0DnqYA1DgpoSJFDB/05Hn0EW+OT3xb00TKc1uE3TpXmPxJNKM1Wdr3sxcW9gHY5mzkC9XLkJjjwJWki4LFL3vEqwNEBRsXAPT+/6ZIAGjv+ZhoiyCvbZdgbYDuZ81n6HSXsRFol4QwzMYBiA/wZ4xP3Vj/YVeWtKwLZxb3i3ioihKdEsamlQNt03ZIV4+rmSOkOA4vNfrjhPLTzoXzCjsmbT6TRxv/kuxxl4dkMSVUrIquEaJPrq3OScA7pORgthrdsrDBUWtMqxOl7MoXE5hwdhavdvfWScT2Z/I5C0OqoMk3ACgWNOwqzS6X3EoYlsqQf0pSDY3GK6/BukBztGa0Hvs4cKL3r32b/SwsFafunPyvb9383uHuDXX8+eIh/2d5xjvzGCt9hKl8lNXBwRltFBcoYxSBh0KanJpJyatDYJ5t50NvaidEre0EojLhQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(261009221727099003)(261026121527099003)(261026140227099003)(261102130727099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261009223027099003)(261028144727099003)(261009223327099003)(261009221227099003)(261009220027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ayeUYTRdbjeQukYaMR9/EkkBoiIklFh5arS+dLcSXReV+S3SgPbUVCMrdc?=
 =?iso-8859-1?Q?M4Y5Uqej8Zd4ciVqx/8PmhlmoBLVkCEuiAYec9SFhoW7tzBiqOHWuUSCFb?=
 =?iso-8859-1?Q?H8H3bY2hIYremqxwvfZYxUC7+BbK31knFFY6Oi3LEGeqf0LMceRacJTMur?=
 =?iso-8859-1?Q?pmKpESe6ClhiFy8KhuDToZZxPW/1nPTKn9BLDMrPfNWRTWa6Mv5KQd6GZ4?=
 =?iso-8859-1?Q?2QidmnWFD1QuaWlFZqyEayqkJar8eWPPwndEO4NxCuWMtNmnBpZbyNuBPy?=
 =?iso-8859-1?Q?lJRShGbHEyLuwpLxsZCp0x3EnbeUpk9SoGPge5mI9eTMZHnmmFJg79TXqP?=
 =?iso-8859-1?Q?lF6rGbS8TSdNWAjACSbzNguVUHTQIkS/hnSS9pd2NvBe9ie113fqi0Y5Yr?=
 =?iso-8859-1?Q?5KvvEqvrWuE+/QcuEL58EMO4NUsuj7VveV3Ln9bFO6/+K+rZsVCOHjmKe5?=
 =?iso-8859-1?Q?KNvJIEeO8l7RR8ETg9qG90x10U+c9hj4HT5tBJvDqwnyjr/pP+2hJNYErk?=
 =?iso-8859-1?Q?67XJK9xcKGT5hHCFWS9SaoYslDECCHZLOZekK+QXdAYWX72JMZh+UDIOUj?=
 =?iso-8859-1?Q?wCe3IMaPu6kgKcyDJLmZv0KCRCGNcnWZKitAIBg2L73A7tVG42otVLzo22?=
 =?iso-8859-1?Q?QgJ48NnknLDsMNOdmyAowkIfFLew9Y4KVNAcXhTdMnZoEdYx5M2phmAqV4?=
 =?iso-8859-1?Q?va6h8qkXRVEejbtP3zey8VBdbcTfyrebbfUBGLI28lff+pKa0MV6+o6c5D?=
 =?iso-8859-1?Q?Oq4h9vasJ1MA5Ce0decw3T0IF/UIZedVy6yG9Ko+YGDgxd/3NbLTbp6C3W?=
 =?iso-8859-1?Q?sPLavO4/6E/wQrC4P1VL0RkhjqBQ0b0/MirpRqtZe5LfZ+coDcWkv0rt79?=
 =?iso-8859-1?Q?wc3YXCkTr2pe0/T3SD/VwmLXFE5pE81r+84LJGNNevKZstgdOSQ99hUnM7?=
 =?iso-8859-1?Q?fHvZ76nvgUeYOu/pHtuYmM2LpQxerxzzho36zaQ9kbLl5VT+5FV9TElLJr?=
 =?iso-8859-1?Q?EIZd6QnhvyhkGHJPP32D4ePC65/DILQjIOX6QDU/8Hv8Z1l2oVXgF2QQ0u?=
 =?iso-8859-1?Q?hFsyVrhVPY7M0ElXLPzqn0ESCj8GfEpiRO+Obibu73ltW6szZCi2OgsN/k?=
 =?iso-8859-1?Q?7xOxq3+84fL0SYYuos0QP5MzcD2YGzmAOMNdplXpozC7Nn5P+qkM5lf17b?=
 =?iso-8859-1?Q?EmWHZqt92+eFxnsJat9tEOlr0cSM6GepUtNww/4ikll4DHInPxiuJp64xi?=
 =?iso-8859-1?Q?3BXnHK4q3JOtgk2LnuwtG4tqu7oJRikbMHoac9R+Mk5+uxBQw6x6KFqZNN?=
 =?iso-8859-1?Q?0hCztAPIbMNgAYRBSJCglqWmR3cYPhtCBasxixyZwOUGNBEtUvyAqPwOSC?=
 =?iso-8859-1?Q?mFCCKEm2EabYiVBb/UK5aw66H6c+VzGVzDC4q+DUMmNKDEvCTHRQQHGzfQ?=
 =?iso-8859-1?Q?3joRgi6Zo72W9RHV7uiHzK8WP+uas+9uyWeBJKiM7c+PBY2M9ZEVmrWYHJ?=
 =?iso-8859-1?Q?lQens8jQpDob8epMK7oO+yLzIq1NN4oYjZSW73pYDVDvSepXdFkY7FKVmO?=
 =?iso-8859-1?Q?S/a9Mkc8t8KytMfF12tDK7RJinToKueNZ36P9tfPXnBYI8zz/1e5+Gx8Be?=
 =?iso-8859-1?Q?3ox+OyLVjcEZmuFhgsHv+p5tv2YL/rRA0z9VrQhKQ+s8JvpkpujB81M+oe?=
 =?iso-8859-1?Q?m90Bh6cRV3QhhdE0q5IvajletSfZLo1qbD1BwN63AhGWG9Jyf3/YAvtWuZ?=
 =?iso-8859-1?Q?i8HmbhONE+3bupqQ8b+qUwIi2C2jyL0vq4Sfv1SUC2xqUgRmy5WBDhENUe?=
 =?iso-8859-1?Q?7u3fSDeMEaupt5BYpTu5vAoxrmBp90Thny9JB8NW2T94hf3ObaZv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69141105-4230-4548-bc0d-08df442a376e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 21:40:22.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGwdY6rL6thH1bTIr8O7O/8hwIghCBqDUCl06OSaztFgcEy0MNmCNRErU2/TaykJ4HEVLB5iOb305H9tTQyj8ab8op6PMG/YxHUYk/c/w0/baZGIze/WUycA+gdW2EBZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10378

On Tue, Nov 10, 2026 at 02:15:38PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] dmaengine: dmaengine_kill_bh() returns with bh_work still
>   queued on re-schedule
> - [Medium] dmaengine: flush_work() in dmaengine_kill_bh() triggers flush
>   dependency warn
> --
>
> commit e183b161b65ac0da135cdea21e6916bb3483d703
> Author: Allen Pais <allen.lkml@gmail.com>
>
> dmaengine: back channel BH helpers with WQ_BH
>
> This commit replaces the per-channel BH tasklet implementation with a
> dedicated WQ_BH | WQ_PERCPU workqueue while keeping the dmaengine_*_bh() API
> unchanged.
>
> > diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> > index f3c1283b161b6..97d8f9667ae5f 100644
> > --- a/drivers/dma/dmaengine.c
> > +++ b/drivers/dma/dmaengine.c
> [ ... ]
> > @@ -1449,9 +1451,34 @@ static void dmaengine_destroy_unmap_pool(void)
> [ ... ]
> > +static void dmaengine_flush_bh_work(struct work_struct *work)
> > +{
> > +	if (!work)
> > +		return;
> > +
> > +	flush_work(work);
> > +}
> > +
> > +static void dma_chan_bh_entry(struct work_struct *work)
> > +{
> > +	struct dma_chan *chan = container_of(work, struct dma_chan, bh_work);
> >  	dmaengine_bh_work_fn fn = READ_ONCE(chan->bh_work_fn);
> >
> >  	if (fn)
> > @@ -1467,7 +1494,7 @@ void dmaengine_init_bh(struct dma_chan *chan, dmaengine_bh_work_fn fn)
> [ ... ]
> > @@ -1487,7 +1513,7 @@ void dmaengine_kill_bh(struct dma_chan *chan)
> >  	if (!chan->bh_work_initialized)
> >  		return;
> >
> > -	tasklet_kill(&chan->bh_tasklet);
> > +	dmaengine_flush_bh_work(&chan->bh_work);
> >  }
> >  EXPORT_SYMBOL_GPL(dmaengine_kill_bh);
>
> [Severity: High]
> Can dmaengine_kill_bh() return with chan->bh_work still queued on the
> workqueue?
>
> Unlike tasklet_kill(), which holds TASKLET_STATE_SCHED while waiting for a
> running tasklet to finish so concurrent tasklet_schedule() calls cannot
> re-queue it, process_one_work() clears WORK_STRUCT_PENDING_BIT before
> invoking dma_chan_bh_entry().  When flush_work() runs while chan->bh_work is
> executing, insert_wq_barrier() places the flush barrier on worker->scheduled,
> ahead of pool->worklist:
>

Can you check this one?

Frank

> CPU0                                  CPU1 (bh_worker)
>                                       process_one_work(&chan->bh_work)
>                                         set_work_pool_and_clear_pending()
>                                         dma_chan_bh_entry()
> dmaengine_kill_bh(chan)
>   flush_work(&chan->bh_work)
>     insert_wq_barrier()
>                                           ...
>                                             dmaengine_schedule_bh(chan)
>                                               queue_work(..., &chan->bh_work)
>                                         /* dma_chan_bh_entry() returns */
>                                       process_scheduled_works()
>                                         /* runs barrier from
>                                          * worker->scheduled */
>   /* flush_work() returns */
> kfree(chan)
>                                       /* processes pool->worklist */
>                                       dma_chan_bh_entry()
>                                         chan->bh_work_fn  <-- use-after-free
>
> This is a regression when chan->bh_work is re-queued while
> dma_chan_bh_entry() is running, for example when a BH callback reschedules
> itself (such as dma_tasklet() in ste_dma40 or mv_chan_slot_cleanup() in
> mv_xor) or when a driver calls dmaengine_kill_bh() before tearing down its
> IRQ or timer (such as mtk_cqdma_remove() or tegra_adma_free_chan_resources()).
> Using cancel_work_sync(&chan->bh_work) or disable_work_sync(&chan->bh_work)
> depending on whether the channel may be used again would wait for any
> in-flight execution while preventing or draining concurrent re-schedules.
>
> > @@ -1687,15 +1713,28 @@ EXPORT_SYMBOL_GPL(dma_run_dependencies);
> >
> >  static int __init dma_bus_init(void)
> >  {
> > -	int err = dmaengine_init_unmap_pool();
> > +	int err;
> >
> > +	dmaengine_bh_wq = alloc_workqueue("dmaengine_bh",
> > +					  WQ_BH | WQ_PERCPU, 0);
>
> [Severity: Medium]
> Does calling dmaengine_kill_bh() from a WQ_MEM_RECLAIM workqueue or a
> PF_MEMALLOC task trigger a WARN_ONCE() in check_flush_dependency()?
>
> dmaengine_bh_wq does not have WQ_MEM_RECLAIM set (and WQ_BH workqueues cannot
> set WQ_MEM_RECLAIM).  Because dmaengine_kill_bh() calls flush_work(), which
> passes from_cancel = false to __flush_work() -> check_flush_dependency(),
> flushing a pending or running chan->bh_work from a WQ_MEM_RECLAIM context
> hits the dependency warning:
>
> kernel/workqueue.c:check_flush_dependency() {
> 	if (from_cancel || target_wq->flags & WQ_MEM_RECLAIM)
> 		return;
>
> 	WARN_ONCE(current->flags & PF_MEMALLOC, ...);
> 	WARN_ONCE((worker && ((worker->current_pwq->wq->flags &
> 			       (WQ_MEM_RECLAIM | __WQ_LEGACY)) == WQ_MEM_RECLAIM)), ...);
> }
>
> For example, sdhci allocates host->complete_wq with WQ_MEM_RECLAIM and runs
> sdhci_complete_work() -> sdhci_request_done() -> dmaengine_terminate_sync()
> -> dmaengine_synchronize() -> vchan_synchronize() -> dmaengine_kill_bh().
> Using cancel_work_sync() or disable_work_sync() in dmaengine_kill_bh() sets
> from_cancel = true and avoids this warning.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1794315350.git.allen.lkml@gmail.com?part=2
