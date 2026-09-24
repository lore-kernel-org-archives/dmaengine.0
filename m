Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C176A4AD4C0;
	Thu, 24 Sep 2026 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266100; cv=fail; b=ggjjxt/eDudm7eUOVNWX3yxCi4ZPtLPC1PFaZthRaObM+rQVD0e65q0+/MGzGfCrD8HbCuqqGkFOMoOmVs5fUtbXoj01MYaMIzOvIHEsfXGNBv474n+V9MXdQS0zIqEfbCsdYoMaPPRVebCQmTs/CRIi/JQWBm7g2eygA6K5PZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266100; c=relaxed/simple;
	bh=0xDRghnAxU4rKB139DTiXgfhriUXffGmqFXHYwOrDWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tOETLxqnIMAYwGLXTYmpdfZfNHvaKnf292FkJytUV9lem3O34kuAptOnx5x5kAdoQfFfJNmUvD8/6QNRhvQ2UatYiXCeV6+O+xtwX+y3pSBqwyx5ZqkwJuvy5bGbS9SOVd4if38Qf6plxcFJpL03mwEvc+Lf9FDUoG0JIA+KBLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IbkM/rMw; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IbkM/rMw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSr7ZrRfuxkXT2upl8Yx5I0xowL/06fMOJeb8LtrOV8dSz7rGymLixZiEvMi1FA2QZp6rCXlgFjjan5iNnpTTORZopa5ic5xPpXqJNKjhRF9qvIw4r1ngxMki7R8n4lbO8Xrn2q84PoAld3ET7q2HqJStmnTGdEyj8eSDJuHmzH/EjegiWIN0c3uzeWajQ+7nGDLV6m9zqR4lj69ajj4bDKmRIy7ykPlwO9Hu5/0ATfZkCtpKMlHkJml+ZJFIJetYam0N1tPfTFmLFWVAFcgyX77NFs55wZPLbJPhB0euaKbdlvFbIIrKY+Jjnk2NNECB6XO7MIIYwLFtYTLcBMk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhCAmjrVBQCUU1tQgO/+akczhK41bWaVvHGa3NXH7nk=;
 b=vY+QjaDqV+AJlbJsOxRbImApuzx0bq1lubWXH3ruCBPFtkU1tG3EzGaynach2LyoyCgE4oSkDseTBB6Aa7FdFRPxS5gyNAL9m3xWO71zgAzG4g8H4fJvEnH2GlxtLGfTVuyww6OL9BA4LOlMVQA+tnk0G3FpRFJmxJc6tqmBbJdY3sFY7Ngh23ypJI7ZsoHPdkc+efQPuSkr4LX0ZQVE6DcphbedUc9eGoLcW732pjgRzrVu+EW0cJ1uN8A07d2SKTUQBYVWHwxArUjD9DV8AG5q5OiWTcqYUox1ydsWJnMyW2qbA7svYZ2W7W3L/zT5O8oxM+1umhuOih632p+1uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhCAmjrVBQCUU1tQgO/+akczhK41bWaVvHGa3NXH7nk=;
 b=IbkM/rMwKXl4seBCllyOMGnORWntgwDIxSrgTtAyUz/sNlrwzX2ZFGaPGpbz2WAd4tvoIaC4L3oAFx4ms/d6HJMm6BcGTSfVv420Z4gbr0Idl0u6JJRgLmQRFDdNcsIyRpw3gU05XFTBCvzwfTwqcNCNzl0G6P9hL5f5u1tniMBB45AqbdViPu2ZWASYfymdiGoQkE2zbTwOZtOgZqXDgBuR1vwjx7LTeYNFhc4sHY4+/5fIcHlKZA/+ZPm7IVZL9aAvdkwhbkp8JWX4336caoXMqa7veQwIGLMIMFD8x0WyBPsi21yFqScLfaS4HDppJO8ik9mqTst9aRp3nmJlWQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9648.eurprd04.prod.outlook.com (2603:10a6:10:30c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Thu, 24 Sep
 2026 16:08:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 16:08:15 +0000
Date: Thu, 24 Sep 2026 11:08:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v6 21/23] dmaengine: ste_dma40: Search all blocks for
 fixed logical channels
Message-ID: <arVK59RwMIh4oAEz@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-21-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-21-fdb6755020a2@kernel.org>
X-ClientProxiedBy: CYXP220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ee::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: e1925dd5-36c0-44e2-4450-08df1a5609e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|10067099003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	9zl4fp/ly5OJ3yBGykGpOpMRRvPTpk2/MLPyB+3kKspKlcfJIzs1TQnc26wwPyexvsKuNvFr/T+E/QVrrB+wZVO1aU8vU0/eMvJUdJf6nNQbdvBD0HGod2GNchdK1xruN+SpExkQ4ksBk6aHSQpVt3yOuKonLyBjuy4CSehR5J1Z88jNXHQF4Z7dXEPzLC1XcjGxiu1IxzNnbcK7GVk/syuDVa0Xl8hPSscDwwwe0cdVW0wyP1z16oSYODWD9zbRsk10+zb4rZhNBdsizId2xVvaqOqnTNl3gqS+xFmge1hfyCs4UnaylvLhIe6H5C47XkDyWwElZou9rnzFT9uKt0+yLvsAM1Wg3rylN5mUaODGK/HVJ6BbTfn1rJBJHLy3BapjPknPscZA5a7IR+Jux53caSY5yzWkCTfgPmjBged1S6Rvl6gtaw9gEuX8hMXf8uKB48PFButOlcijPi7yIaKhcAFo++WVWnkNwWVyR9Kih/RwsM52owb0wDGiOP5rO64oqSUubugJDBxCERyaFiT+DRrYb9kqsFo1ihU3HfE/xVTQ3pNGn0r1gR4QGioRWcSnvgUM7OBQzXdmwC8BGTP1mqVNXmpnYLFDGvKiAWksgs1TcMq0oS8rrMpRsSe4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZ+vtzuCtd2rBu1d7JP7JOM0r9k8VCIsdA/E7lDDWHy1D3XDf/pojB/06/8/?=
 =?us-ascii?Q?pH+s+DzqszYaLc4PVf/GZqN6frqh4gxs0MgMVvcMksunoUmV40NAatgBTzZA?=
 =?us-ascii?Q?wipYm9VWFH7ReLlFpOcwOyPYwn+kqGz1aPLudZeHx+xCKboCr/7RhhtEiGT3?=
 =?us-ascii?Q?C42am6iZbs3zAmCObGMgDwEPRFupoTztFHmP8soBx9e5q/lnSEGVSxeyGsh5?=
 =?us-ascii?Q?WayUhbIulN/BmanZDcsGcEiK+CgNomfD58JOK6OFN6kFiUoh+MCkSwth44Qb?=
 =?us-ascii?Q?Ud6PWu0BxQyeqkp3n1aCwpdn/uuT7nKyoYwic9fZpfe/pDKh37EJGfHfk6LF?=
 =?us-ascii?Q?95VWdF6Bos+2dr/XhakOfVxJUSwWV0JQnlXDstQucY8AoyDDNPrUMgNE9VEx?=
 =?us-ascii?Q?T1SC6nLSvMwyJgF+6DiXHonzUL/WsS1Sap2K8bPNJBjE8Ob1mcL48AJE7WIe?=
 =?us-ascii?Q?ArBDd2BrYWWFNR/8+6A72+IFZ2hZEOSMYS3UpLZW/MwIPef/EZOAbPZCfW7g?=
 =?us-ascii?Q?yBfk3TPpGAnKNsL/c4sClyWAcv2Lxcmfq9yX1f8ePFOmc496T7a6Cbxp2Nuq?=
 =?us-ascii?Q?GmT1hiWXVd6//tgGVPDzqXnmD85UoTHVDlTgU+aJT2k68tv1fA+lLa/K00N6?=
 =?us-ascii?Q?CBmhX2J+suQ149mNzQrDUThyDogCMhPDkJxzWxlEcEWh8pnGt61tGn+NJNEK?=
 =?us-ascii?Q?SmlYr4C8jN5dXXQ0L/vG/hK3BSvmQ17ez+0Pupqfk2ncTIvvkIW7zu+TA+jS?=
 =?us-ascii?Q?FI2XIk5ujP+CpRA+c4bQpgBPri8itD6r8pVZaAeRE4KwsHXuxAFis7/424vo?=
 =?us-ascii?Q?Gp0PPvx7AnZWCSwOsLLI1eefWslZeqLZxY4JICY71h4aerBbOE8Vhv+1bypx?=
 =?us-ascii?Q?Gc2aOZCAErC2KYdT06ekRTQaZ8AmBqVo5gMLRy7gkSLSTRmWIlm6Bz+yoAqf?=
 =?us-ascii?Q?K9P6rioLSAZh6yNWhSRWzGenVgGlu+UrVZ2XfmgXRHA3Cg5A4pAtFcBfgje0?=
 =?us-ascii?Q?ESx7FJ+mRlRjab6gwO7kGR841v0SFboIsZrmBnj9lFyjtifz2XZAgeNgJbo9?=
 =?us-ascii?Q?ZmJ5G65EZUSHR8AOsbDiDBGdkYcrsPK3aPkeYHVLOWW0zdrk6q0JgImQlJHR?=
 =?us-ascii?Q?/OH7vB81RMYm4/+FOqZxX1SFlcw70tJ1JYo200/rrSdICNORhjc1hBdgTq+r?=
 =?us-ascii?Q?f6B441L55+6gmcH5+K1Lna5/2YCyS+fEKteMgeSODAx6YH2JX8WxUrc8vz8p?=
 =?us-ascii?Q?+ZpJvOVx5NloPO+D7vrnZzDzBUpm1wWAWUNQMpblYBDUbARo/E9KXhM8Dyo1?=
 =?us-ascii?Q?24HXm4bAEcXAu8lMqo8VDkcz9RGy336vSDA/Fs4gFv0N31/N1/4lFQtg9Pye?=
 =?us-ascii?Q?LjO0N+mxuQiAODRt7Bji9WHxLshsjeCg6259LrFrNLkIQv4gd4kurDumBmL6?=
 =?us-ascii?Q?54EeXCFSOVQNo0drjTIlzVSlH72cXi8O4zE8iuJ96rrs9AxcY8qIgzumi80N?=
 =?us-ascii?Q?gQhRZfLfT1VMHPbu5KBDA8eqW/r3YlwueFSKeHyFm9++lHdSEk7UV15ZuqBj?=
 =?us-ascii?Q?b7ETPxaTbVyr4yYYXj0iHR+6Z3nGAdg6C03e5eiU61Twe7mEapHIMowokvXv?=
 =?us-ascii?Q?QWU9mz4OdVDuphhjXtEanhI4kQn+8ZxQ1S8XhAAG/7k+6CcOxmAlHQkPIA3J?=
 =?us-ascii?Q?3AKQ7RSOjT6r3Ndn+64wtWPbXuwpMA0fr2ymzXCRDSIXwFv4QvI80wdWb9JA?=
 =?us-ascii?Q?heXd6Pnoh59HbmKr1iVc+eyBLd7G+EPgdHEHX/SO4Z7FLwIXHxUk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1925dd5-36c0-44e2-4450-08df1a5609e3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 16:08:15.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16sJOebC/emDuCKChWCo53VV7QoUo2vh30vbkRPuB6niZLqz53fkxykkXaUoi0ZkqnKv/nvSwIwUyTUuW4rXUYist1NHZHozOssKZsW3SgVxPL4GDMyQk/7AHpF8+SEe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9648

On Thu, Sep 24, 2026 at 10:35:33AM +0200, Linus Walleij wrote:
> Fixed logical channel allocation scans physical channels in blocks of
> eight. When the requested physical channel does not belong to the first
> block, d40_allocate_channel() returns -EINVAL instead of checking later
> blocks.
>
> Skip nonmatching blocks so controllers with more than eight physical
> channels can allocate fixed logical channels from the later blocks.
>
> Fixes: 5cd326fd27da ("dmaengine/ste_dma40: allow fixed physical channel")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index d3d79e394d02..def2416fb1d0 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -2111,11 +2111,8 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
>  		if (d40c->dma_cfg.use_fixed_channel) {
>  			i = d40c->dma_cfg.phy_channel;
>
> -			if ((i != phy_num) && (i != phy_num + 1)) {
> -				dev_err(chan2dev(d40c),
> -					"invalid fixed phy channel %d\n", i);
> -				return -EINVAL;
> -			}
> +			if (i != phy_num && i != phy_num + 1)
> +				continue;
>
>  			if (d40_alloc_mask_set(&phys[i], is_src, event_line,
>  					       is_log, first_phy_user))
>
> --
> 2.55.0
>
