Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AC14A64CC;
	Thu, 24 Sep 2026 15:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265228; cv=fail; b=f8LC3tLF26lzMLvrtDBNd2Smm9NY2NS8HdwR/Mt4YbsdS9UdhQ/14YVOtnSVMA+95J76mnY4y7kvH+ylUioeL/998GIGUAXFfO3NOcjSNS/Cm11fuCTpNF4wr1wIp+adFhx3ae/Pp66GatpbKjNBui7Iub7J8CsyIrlADSqa7j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265228; c=relaxed/simple;
	bh=mlerV4ZSfmBrB9QY+uWdI/LESkMB2tAidU0mrP11A2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N+4NphUHaxSH16CkhkiKqXRt7e7XPUqcPs72yzjVJpsZqg2E65eASWngDS9Mq+3mXUMjroZyxnsyNNrvXYgpubWwLq5Qv+AvN9l8a6PpCmXN7N/M8sRcAtr9D0+B/zjnsGppexG3YaQnelkEFcLPuLitTrwFxEmw/zeT0pNuSU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qR85WQTV; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qR85WQTV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+bPdJaQv9sFrxzohj0DS9uKUE3IkQbe9VRMRAz1uuNHF5+CT64FJSr1Q9YaZKkxPLhAB98OOXtA30UPnxmFDEbi299J7/1DEKoeVSEa55DCEb7N4iqtMOQl+jL+omgADSNx6G78tO7Kk7yjBtNZoIZrFULMVG+tifk7CWnBo7ofYRyXSEY5ONQOZGOBeb+LjatQtUBGlEEg9YugzmB4N7sIeipcN7WjCcSDY4o/fuv5EXPPzSApPisI1B+2RhhzZ+NUxiH02E8CkKIJEcQCXXBhvLxG1gvM7rUHu08sXaNgUImr6HH4nCRXTBysF8l5eWA317ZuZ0VnDG6WbJUTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOetE0rFLVdOgp/ujlvtABrY/SRsg3ltTi78JQodgBQ=;
 b=dkGiqqlCe91hXNAOkYjfEDECQjXPSOkUCYzRhkRMgfmwVFbzDcwe8VTD6TKniDP+Tq+ONTbw+3Ic7dmlsTYNPMiXOgtcX5dxH5H9jWh/n3i7ILNNXc+wZiJQlA+92a64TbhytpHzQc5qsZYl4zzgMuwiZFTdZSImoEo+ZwFVJlrcleCsGT1EjJISxTZGkRXc/sA/SGZRfIqCSpDHWvf/5mO8HvylGwknXeb7ETCYZpyPm2XZqT0wjQNQqZht37GQhAf8GsgSsb2xXjXt81DsMqalpPM4XUoljusquXiEOYygh5Fv3zlm3d8lYfmhMLVDGUz8hTUmL5ojj0f7VzK4kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOetE0rFLVdOgp/ujlvtABrY/SRsg3ltTi78JQodgBQ=;
 b=qR85WQTVhVqQ9Dld7cuZB3R3c/P0Rt+7B0stEM8I1QLyYTILswPBkOeOZb8X/zXzNx2UDArOIuU0n1C/Ij00NMv/NqxY8AybPgOBuLCqYueAGhftUhg/AFaWdZooYxFaOKlcVWwg4dcq0eJCtLyPwvpQzHULUuwFnkaWM/Nc1cDlT7gszr/u1f82otXwsE/24Ke63+SRFlwNggwlXbw3wC52NP83oEhfZoaeCBAl51xwOt+tfTgh7eiH/RSQzZR3wM8U2H01NoML4vdfCOTfGchAZhG3IJ/HJPdCboA5nJafYEE0C3PbS/506Mdjw25OP2HeuT3+x/O+EEvdPGkoiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7060.eurprd04.prod.outlook.com (2603:10a6:208:196::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Thu, 24 Sep
 2026 15:53:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:53:43 +0000
Date: Thu, 24 Sep 2026 10:53:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 16/23] dmaengine: ste_dma40: Validate disabled channel
 indexes
Message-ID: <arVHgIr0JT9IFc4t@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-16-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-16-fdb6755020a2@kernel.org>
X-ClientProxiedBy: CY5PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:930:2::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f1211d-74e7-4580-9e5c-08df1a54027d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|11063799006|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hXk1lEx9FNpbnGfgViiEMJdK7DknMZ+42aWyNat68BvANpW3hulZxKhd+2aX4HZ4ju5ZhO3z/sgYY1LqK8AGuSjM0US5NFpXSfRbbplohO6GqbGS4ZQ5Uf/BwkW9phpDeL90LXUkdRbQbCVhJwUsK0Ny2vRtuwowUgHgxvGblpmnUem6FTGxcNmnx8Fx+s2kKsnSZboanrmD5yk2hk2tsbckGWSjVANS94Yf8nGqoffkOZT6StmDL1mdfxsIDQ/KGSKuDAkZGT1kgoQQE4woTrP7tNo1Bv7RotKU06gDlb0UBx7+s1X4YQ/cja6ZhbBcvrA9sm6hMbFHq+XueZLBLixYAisk0K7y+VcNtVaWEDYwOeOgb/K0LBpeZRftFzhmrLRKTVNB6RaNlPFGLCVWsWF1FV50EJr3BuQclIMJItZjlfUA9ExiatMVpq36/Ap7PJwTeBy9mlT+Nv/2YGMP7a9SvF5K+mS1en6Fw185gN+8qiSgLu099Qayy4DnMP+afl4LJ5dlb3vREgMqjIti0aBkOEYudhKKvEUC9z3Y71d6zF888M0gz2JLrGufNW5TLf/LgOlDq88dkmuVdi/nF+aUHxpKdOdsVvc9g7smTt2KiegH3C3lfQ2NQwQPFhOUTBYSEM/d66icatZJ2Tth96JyifJklLlzTmD0/t8sYpk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(11063799006)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AVUP/DGKkZuTKeGzYkBBHrTdbIkiQ6uPLeW9H737vsgMIowh9tYhQWY8FzBX?=
 =?us-ascii?Q?jlFNKTI1zDsYIzVOk5BOlkWg6uP+5DY+e8Xcx3oC8gRDDKQJ9gLP0N6CPr84?=
 =?us-ascii?Q?ERjejTJYWhL6nJoJgDUMc2npVqN6pQ0Qe5BY0UAKepbKqjK8AWU7wLseLPuU?=
 =?us-ascii?Q?Hn3YdzJdc30v9apDkeQyHUR4T6ByJz6t8KWcaUtfmXmSFiveE3RUrR9U9Mfu?=
 =?us-ascii?Q?Ptmb9o/EeC9nUrf432hjUXs5zm6LP1tyJRKgAVrgzopoEtbh4BVwCcLutEy6?=
 =?us-ascii?Q?rUwt2rGBPqOGOwqtGm6zjUX0SFexEz9B2zUHh9zU68xgMPcHcivI4BOn5hYQ?=
 =?us-ascii?Q?DmScnCHQdpETczi8ldw3VzCZs4e0Vg6JISykCzM+g3M7n2MOHuRPeLwZCYLP?=
 =?us-ascii?Q?0sSTyhwHVB4tzFn9PTZ/7C+8krwvspjDJNhFMuqg5XDnTd8+B+/KBJziGex9?=
 =?us-ascii?Q?aBS2HcPjFRfTPL6d/Odtpbbb+fdmf8uY25pCIiL7BJDyuPqeBZu6aYlrV9mt?=
 =?us-ascii?Q?dqpSgbzlP3jN/87WG0zdZfs5OIPDVo9enAz89OiwRxrBGhvGT+t5Ckrs/ptO?=
 =?us-ascii?Q?uwbqaiXInzz4NDKPIsHy6u+Rl0WxHeOxp6t5t4xkMQ/mOclez8V7iRclCfQm?=
 =?us-ascii?Q?tt2Ju0ps7/5ogeL7QxgUNqlqGkTVg4y66xwE2avt4tZ/tsqH9QL3tjlLrQgm?=
 =?us-ascii?Q?eLETYoGf9qijM2k6PLODPIBAErSwTqqQr7miQPemdBSOcH7SDmWiXZHEPKV0?=
 =?us-ascii?Q?3aTgnygyTNIHarsrHbNOSZqfGFxv1dDiQ+opLZ895stWTVfL6mtPEF8MYMyc?=
 =?us-ascii?Q?W2pAU+9SNYUUzSHhGxaLUc3JhQbpzV6ecBEuMP5u4gnl01GMEYZkqokQEG/D?=
 =?us-ascii?Q?Q2/k4B8LQe7q3Wf7yTQ0+vM0JYV8y8n9pIV62YnUtd9yBQjrNvTS62jJpdEj?=
 =?us-ascii?Q?WhSYBX9w6a2AVEqZNGiQPlsTfM8xfKhkZVXQvQhNUr738aONfSdgV/gBwKGW?=
 =?us-ascii?Q?EDyzesQgEWouOgAe1gWllYtfXwsXRJZ45sFME+IORbJP2oGXky6p+fC6aMCs?=
 =?us-ascii?Q?UonCDuMnAxy8Wp8tfcN38yZQzs5rC5sFD1uHNSpEDXvXqK01jnjrucfkaTWU?=
 =?us-ascii?Q?uHbdPUkbQNA6S2A9F4E4JWq3inSjDPo3LsLWAzyQLraq9CefgVDRoOazZkVq?=
 =?us-ascii?Q?pmm2Enq8eBtx95GwUQBsapWD4hHizKop21uz7PvVY9pptItlII1OqSX2oBLO?=
 =?us-ascii?Q?oCk5DVHUiYfYMZ+qbdTrVXwIKi9im46iP+nsqYLwjbN6qhYtn0U3skZ9Dz9y?=
 =?us-ascii?Q?+0BtE6CggRKWzi4/oy4mWKPxsK4T9BfSCL9DLNg9Vv35a64pf/YPiZaC3a7Q?=
 =?us-ascii?Q?2kxyqgjmcgqy0eDhgeSt/Y/pQ5y8+c5nSn10kUbei80o8F+ET9NNyHt28iCm?=
 =?us-ascii?Q?YH0P2BuScfm2BEGVVDWRa+hNzeCiK+yc0RSO75jAeqe1O+szJH9tIlWJkpmz?=
 =?us-ascii?Q?FQEhP9gxlsQ0YdRoOpI7iyongS/cb2g9GqztCaf6T4AmhQ6+peDvL0951r3B?=
 =?us-ascii?Q?N+3iiNk7rSvqrCpMlcSTcnn7sra/AWi1+h9w3ax2ZCMvDxEoGw97u35RMrwy?=
 =?us-ascii?Q?+lFNTQG15x7euoZrdxCtsFzZdgrrZg9GwdP67pbjGHXUfI2ZXZcqaD1XH42f?=
 =?us-ascii?Q?vCBE4QuGQBTg+OIL8SwUnvsxP9aPGV2giy2tpbaZCH0jtKe44hytrzkLdMBu?=
 =?us-ascii?Q?p1brCv8XPXWfNHljC3crF7ec+YDW+jBbk8fW57TiZTq6Dt8erxdl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f1211d-74e7-4580-9e5c-08df1a54027d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:53:43.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvkpoNBJiRYdKfBJ+Y01gOv9TWS+wvgV6y4IlpCQjkB9qdlN1VbT8j1tbQ94Bsvm8oKmURYgoJvJZkCQyPQoEcfbveJD+Oe34k2i3gnWejAJq+Wz29apkrzGSAC+3aLk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7060

On Thu, Sep 24, 2026 at 10:35:28AM +0200, Linus Walleij wrote:
> d40_of_probe() checks how many entries disabled-channels contains, but not
> the channel numbers themselves. d40_phy_res_init() later uses every value
> as an index into base->phy_res, whose size is the number of channels found
> in this DMA40 instance. An out-of-range value can therefore write beyond
> the allocation.
>
> Validate each disabled channel against the detected hardware channel count
> before allocating and initializing the channel resources.
>
> Fixes: 499c2bc3cc89 ("dmaengine: ste_dma40: Fetch disabled channels from DT")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 24994e9bfbbb..ed233676e718 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3422,6 +3422,15 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
>
>  	num_phy_chans = min(num_phy_chans, STEDMA40_MAX_PHYS);
>
> +	for (i = 0; plat_data->disabled_channels[i] != -1; i++) {
> +		int chan = plat_data->disabled_channels[i];
> +
> +		if (chan < 0 || chan >= num_phy_chans) {
> +			dev_err(dev, "Invalid disabled channel %d\n", chan);
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* The number of channels used for memcpy */
>  	num_memcpy_chans = plat_data->num_of_memcpy_chans;
>  	num_log_chans = num_phy_chans * D40_MAX_LOG_CHAN_PER_PHY;
>
> --
> 2.55.0
>
