Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793116994;
	b=YEOj9E5QeZwu9hC5vCnV3o/F74T7nlppZ1uhRUpIKHgSEBeE+tSEBZwugmaGfQW38Xg6
	 P2KbjkX9s4bAl5npuILMof1IO8P+KhVzqyHEEyKsn0XAmfIzfIADtpCwwqJ8pBSWA5utr
	 Vfhm+4vQ7eabOfQU2+urmbkgMqPuFuxwTILTlJfHtqnGTzfhKvyHbyRwRIlo6imG2K32l
	 Kq+33BzDTAo6o8HPRTC6vJEWZDMQ60I6S79k1UDlWFKFspoNQqm+jtTk5PALfTHi8B5EL
	 a5hQOgJap4cCXd/h9+/DnbyUMTR5jrsz8wm0J1BLqeRw18/e1cqPoNxHVv3tThrBh8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116994;
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
	bh=3xaTeM4rGTLliSpBjYXXZSjrG49tAkIUj8lE+yoR/jo=;
	b=XRt3OdQDmufIw8RyuLA9nKIEWV8NCkNytifP2rR2RWrxmj0zKTS/SfCK4F7xuTrgFRi/
	 KKlT5QmO+SxAg9Nxzg0UwmZRhjR/j3j5kqCAb2UnwYiNH5DI7HVgfpzZvnCYsiVYa4mnl
	 YegkcUcj80qeP9e86fzVJ+zPTjyAezrE2axU6MbEW6gMeDT7L7FqJ6z8XEUyc/mbykML3
	 IlNqZLj/LtY/DPH6iCiIELM1pK6VpaPktcff3/QN4YuJuPJAygB1Gv6AdQ3JmGl8WPTx1
	 2Iq5NKDtg9c0NmJ1zByHxO7zzjnfTGEW37+y+E5mYFbhbQa7p2pFZXFg9ZkbqSqXClw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EPSnunt7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.16
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C78606A31E
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 16:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C78606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EPSnunt7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xF5oOxtQDZ6zObbuhPH0Qc7mJzBRsL0wU2d2OPexMsRRr9n9u3/pFVEbPvLiaIpteAZmKVtFlTQLdZ05JZNNClDN951CdCPo0SF4KHy6upabmSCrhhyc93OG5LHRzKa9NLccLaSPN0XueN6fC7J3tRzlrsbuciimD5UoYcHZx3S0RSS9cX0LZNG5H32tDypH9r7QJCpYJ73ib0+w1Ev+dsVJ1kDyM3oK1y9aEl1AOLQ3a5OsBpZ/J09+Vpa6WNEWxVLsdw7dMZpq47x3MGjzg2AOWg4hb2VQhm+vYWF8jjSHMk5nyuIDGtSXhgUQiij3R9t0lOfRsjkoJ6dKkfr7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xaTeM4rGTLliSpBjYXXZSjrG49tAkIUj8lE+yoR/jo=;
 b=Ddypa6wFwTeYJghVhoIBPpz7TfPRUEpzdwla6/YJ9sHZeLBlM0vU0EPdoFiRzqfLzZxREEANHKVgTDC4xTdTbAl2pdAOjvqiEPRIL1pQlyqcHetCyEEHFjuyLC2MSIzKsk5vGlR8MGGt0m6KgobZU4DFljqYHtpxyMN9F+K1r4agwGfMDZ+yUsdJzQZZgx+z8VW1N8YewMtDU1Z7KisORk5uoW3eUW3/M67dGoCtYr9GUSoeg4IHhONCqb61ZZnjID5hMmyDB2h8WnRcD7/P4ojFCGa9PiZ9zEeUXQUkqeygpJZtt2V42EHi2bzOo//7v+RALLKeHwbpQlCaL92nJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xaTeM4rGTLliSpBjYXXZSjrG49tAkIUj8lE+yoR/jo=;
 b=EPSnunt7QPrTNOlwt25pEBOw8xDVq4rFcHho5rbUB1o11SZ5XkQq85d5TjXGld/aysVB8/9yy6k0EKFVjReqK1Vs+0w4v6XeUTSb2ELBkba0zFjVGgFnWCB8fvUcu9DxVUDnbHw4DXfBP7yk1UuPzeVGPiI2iLor9TvGnweSQz261QRVsotrw/1u5P/2wmUpatGnXvDZ4yWBpAW2WE4SvPFCqdQ9McMjYnnpDxn0Kk3ZFDWir06TW/PFIix8gjtuiRYuYOgnA3toBRosovARimg/kZe2ukBDNg+D7hx2TcdpNUF9FzdCCNzyjsk6x718Y3PlVcDyLnwxyglJas0VQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8210.eurprd04.prod.outlook.com (2603:10a6:20b:3e7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:03:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 16:03:10 +0000
Date: Tue, 27 Oct 2026 12:03:04 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Daniel Byrne <daniel1.byrne@intel.com>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 09/17] dmaengine: idxd: quarantine terminate_all's
 descriptor slots until the device has drained
Message-ID: <auDLOAyQefl_DdwS@lizhi-Precision-Tower-5810>
References: <20261019150630.4026341-1-daniel1.byrne@intel.com>
 <20261019150630.4026341-10-daniel1.byrne@intel.com>
 <sashiko-outbox-178035@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-178035@kernel.org>
X-ClientProxiedBy: DS7PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: ee1d535e-ddf6-4ccb-7837-08df3443cc71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|11063799006|4143699003|56012099006|261022105027099003|10067099003|18002099003|22082099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	1cdfWFL+tlS1L//jozhpH8dNptWgcO5i+DzhYpnxcTOi0Vpwz5c9Fjpny2+p7m+tC4Up1g15c91mX4kKhLV4pbgTqC8BAV4wqOuXrMPZiw8/g6N7+mF2jzEi0Km6YHNsL7RAAEE9a5VFFeyI21vn/gja8o5IW0QFPbt6p0NmXQj2t3d0fe1vpV2LKiYBRor96Qy5iqLd34zVSMiCUvD5bF8pwpwVJnu7VwKbucKgpvvgu03I0hsF1P0CJw5ILAbQDOC+V8tEoB4uueuvSVqZGDgmmmxVBKCPMxGk27bXsuc12RLiu1xZw9Lgit8E4NcgC5eo2/4X4/mkuL6X/1LeOWTk40irWwrwLWPBq0thB5e6st9IpbozXNeTtdLw00Dres8AmbbKZ94TP/83k/b2qtM6UGkz6NnstDT3Tk+dR14bJhAYCag9MODzCX3Bb+7LhPTjK/PFUcmdSsxtpFVEeEdsXeLfURsMrn6uEFKCGUdVCbIBZCgtrR5EO2FI51v4Zq4uIY+TL8BbV2T4rhPCbcz5r6JDMEH+8hiSJiCdQyDU99R4Jh2nhUUe8wEqceDRnI8SflSYo4X5gifBPhWzi6+RqPv87vdeGByHVcO7XHk02tz/oykzWwpE3MowQAPVZZ/ZjTxrGokwABcAM5Fva1BZnNfsF3t+xsQu+PFD/OY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(261022105027099003)(10067099003)(18002099003)(22082099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ou4eBlkE58qOlZ9FbnqcKanZOaR3+/F/QgQpWRm2bNQIH3Oq1uq2Uy3/xYlt?=
 =?us-ascii?Q?nix48gZLeq8lft/03EguEDzNom8yEd31YrvMozIZGD987u0ge5TeO5vJNDnN?=
 =?us-ascii?Q?4KUhbLzJAeT5C6nR6vJIUblyjKHDgth/TExjFs1GlGv5+W/XqUiN2JsUN/Z+?=
 =?us-ascii?Q?nNzMSMtwNs3c+O4WinZwY4+5NubuLhffG4Lp8vxNPsfWjRW8Jh48cdU9Xd3B?=
 =?us-ascii?Q?3uPqh807FBGCOH9J2hKdahEzFwP5XIbht35Nj9/4A8qFVj9AgjHJpntMrvSR?=
 =?us-ascii?Q?nI0cIv4ifEhWvy2icYiE8Vraa0xGROAl0Iw/59Vzk8C/UhR1ZUGHR8Oxk9ae?=
 =?us-ascii?Q?aunYQgLz1n5IWYJXHF+TZM44K3h2pstR8pa7VJsXb3TAgNr9XFK7S78KyhCS?=
 =?us-ascii?Q?yyFdbPMqS9RdkixV8JsBwUfKH0MwHwFePhuWPMB8p13u8wcV09H5F/6G37In?=
 =?us-ascii?Q?o9YVX/dbJQ7D9X4EsOqz2hTGtbHdKqlWFzBWe8ocAi4Y06kzAenvLn9SDhoS?=
 =?us-ascii?Q?AYpNcL3LRoXaz/0D2NI9oniRx8Gs5NAeAeL1FwXJF9RdGa2MGTfUhw1JqWo/?=
 =?us-ascii?Q?XRceJhgPy3swvEjFuXokde/hzhN1UL6ihD3BaLOoXSYRDPH8jySFxi4B+MUw?=
 =?us-ascii?Q?y31Qrqm823IrgJt4eRzVtB6AkkKzF6ZDLl1D926Aa17pDbeN+PJWwibOYylp?=
 =?us-ascii?Q?UpOxzavZku7IZwoIV8pCsx2FwoHZ06w78610LA/Jjd5XAqhNwpAVfMkrriMv?=
 =?us-ascii?Q?LjjMwWqMvHfZUrpuPHyT6ry4hSVbWYwupIcMvVVo45RZK1bo+1ik1YLjsHas?=
 =?us-ascii?Q?WcvMvE1HXnAW8XwaP1++KuDD3Vh80/SHdZKDkYmaG1sWl99vrWulklTCND1Q?=
 =?us-ascii?Q?TP4alv1/AG5On4tA/BLy3XGAwo1CktIXEtSeB/cg8KHwVPvWmeTGXsUc7cGk?=
 =?us-ascii?Q?ZijtPjkkEXMJSJukT/U8R7wIkess/3XWAf28i1l1tSEqhhOzRMARkpH4oeCM?=
 =?us-ascii?Q?27ayVYX1kfOUxmmWRslb1yhq7nKmzIPnV3nU6e3XAwFaQyFKAudCBvha+x33?=
 =?us-ascii?Q?061+RHDb5Dgpq3IpCUPo2T9v5tOXai2/b76Dqib9TcAmFefCCgJhp6kFppLu?=
 =?us-ascii?Q?Ws0D47eZYCQJdRgKLF5tKlqp16MRbUCF3mlTvQM3vumGZswIbERtgFtPlPGT?=
 =?us-ascii?Q?mJVyr4gFQWB40+ds73NEeGHW2oBMfJrZf2owAaXJDxc/8PJ6i9+gonoDNUMo?=
 =?us-ascii?Q?9e9UhDPAgo0kdH/sIWLYSjRY55jZoqwyWW9zIBSWXhAW4A0O4F8Nm3mH2/E1?=
 =?us-ascii?Q?+yfpfRC4KE6AmwCzl2XoBeulspa5DYGq7zn6HrpXYBMr9CDCnqmSXNZABZi5?=
 =?us-ascii?Q?UnOs93G4CiqPUm9JAw0q/f+NlsrcELAlM+3ZQ+96AVLHS0QS0ezS3u6Bo42A?=
 =?us-ascii?Q?CHD0c71OH5moH0Hm8WfE3egOrEZqI4j47yQ8DJUSKaS6XUf+9Z/nMhxFM88b?=
 =?us-ascii?Q?rkbThMCV0SlDCXKgFcKwRqdfyKQzGewXz1K6eDgM7RzMXbIoQT4cavrG2v2z?=
 =?us-ascii?Q?koul6l7BZfSEz4JuGHj1cqaMBtVcg29B0hWaIURrVe2DZJv1IvkLi5x//Fo6?=
 =?us-ascii?Q?lq4lM9+NMsLcUD/TvHXEEoxMVRAkJ2O27/DaKyM6mcVaHfp37rqPA8KLA2Mx?=
 =?us-ascii?Q?ASEQxsmMCMId5zCt3RgMl78uguqUnJuwvmM4I5XmexfmZQQhFvdTu2yUBIOU?=
 =?us-ascii?Q?+V9I9sezejs5yWsayNiir9lhJZQuN4EIIRTOnl3FkXl9LauLWq3L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1d535e-ddf6-4ccb-7837-08df3443cc71
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:03:10.8208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yx5lpTQZXN2uw7C1NxYtuUbNdtqfRa+h4Nztr5AULLG6r6sRrjL9pvtNg/XyYuewf1cZiV7bDwarj+5Y2YCie5GfV9YLS2v/7Oa6T5/YgcVP6/N3ltdzihr3Y8C+pu/p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8210

On Mon, Oct 19, 2026 at 05:26:33PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dmaengine: idxd: missing wq_lock in idxd_dma_synchronize() causes UAF
> - [High] dmaengine: idxd: missing idxd_wq_thread() sync on channel termination
> --

Please fix all sashiko issues or provide explain.

Frank
