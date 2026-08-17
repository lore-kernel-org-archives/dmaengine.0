Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59CC3E1736;
	Mon, 17 Aug 2026 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982513; cv=fail; b=HuqNMrDQAeDwhu7dc94CY0NpEhxVyiHgGP9xiBXD0BoTaKC2mn5H7Fkd3VIHiE+UMUyqWLUF1leFTpZhV78pHpGMAU6Bh3/oaEzOiZeIUEtexdUDxyIwo7+4Q/faIjT5dcv15GjLEZc9KQfGFsvHVwDYDV4v7NzWrUamxcLtzdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982513; c=relaxed/simple;
	bh=sfq8/CJQ3syOFfOeUcnPMuVgOmKtdrmyxSLChcnb75s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KXK+Ag33yOMcwq3+TDpRkLG0joKFWhi4VqLCcDiLSSnibV515UScw+t/hsFuIsXJIVemOR2KCn9veH5ydawk7Un0GR6q3UmoAOSrrJVnor3U2rZS9M+o/1GGJj43O/Nkfs7In40/GEYIjlZZIzK0P+Z4we5oU3KAHWIS6Q7m+zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k81LW3pX; arc=fail smtp.client-ip=52.101.84.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k81LW3pX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpKtT/c8mvaNCp0YsVmsLVT7I8Hd/frudPgjTNz8/tyeDIX074oeUax6Oocc+k7MEEROluuBqmGonZIBqqmx2p3oksTjOCO/o878Gn9hUZnimyfpscz4zyO+Zv8hSnlbpigMa6tEMOFpNNCVhibZDy/4xMq0kelKQQKXXKi6NhOgpKntNnZcRwHzpVCk4ZG+MtJnQcEnzpI7G68WQOsUdYQOK6cHK3PV09bfpk5DYig+vetwCMcird54Hl7sxTlzXjtCxaQL/7uVBqWJWcifpeYYA6kcbnraJ/CWJJsOhDdJpqdX8LlhFgvbey7DcJvsx7D7HZt8zEypj1UWiUTt3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1Uw3u3dloS5EYu5PUJ//TcMW0LzbZUdaVA1XpRYK7U=;
 b=NrFiDZeh8mrnPfRhzlmq+JPzNyd5s00I44EnvxHWVU3q586+hzKMAAxbcMOwlpryij3rMtX1S/iJHY1WBPyxBHhnHmtLTeu0NjVliDQXqhO1M5/SVUKYFQ69parNzqw93jbtnC/sqp0IlgODHSszvfAoPsbM5rQFPcz3ejv7L4VoNoc3hpkhc3bO3mu7QUNXdDeNIumsJ+5q7hSaxrf6sWg/xBgHZNxtSw3Fi08bLZgihbYmcXlvACCV7+jok/MF+FLszFOuHrVwfDihf8UdaupUAFrDoYxXGKWAGJJlHc76rTu0qgrMyYsAYi7dY7S7Q7dIP/POvUnJ0NDobTPQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1Uw3u3dloS5EYu5PUJ//TcMW0LzbZUdaVA1XpRYK7U=;
 b=k81LW3pXIHop2DxPrYISrh5aFrM8JskHkvQDASdp3JwzPy29Zaf0Xb4Gm7YtVbK1ftk3TfWfFqc+eff1iJrD/G32NjuWJgdReWLRcltClXKiAXZFHVNPueRU2dUCtLnTryWNFOJmqWAA7HJ1E4VYIqCO/l7tC1SlhrGcx2WZZ1WrWxHXXepuTdAWYfhdv2AHYoBbX0Tsmh+E7PJIanumITazqxx+8ebMo3hu0nPGv4glWsPQIsM5ls5F125Zw08yN+4yAkUDCzrj0lZxZSvp0mIqIJ2aIcmPi/s0F7QII00MN6rLnGpqs4BWAq1tVqyPlOch/RF66DMBn554vgVYjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB8047.eurprd04.prod.outlook.com (2603:10a6:102:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 16:01:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 16:01:48 +0000
Date: Mon, 17 Aug 2026 11:01:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Joshua Peisach <jpeisach@ubuntu.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: dma: apple,admac: Add M3 generation
 ADMACs
Message-ID: <aoMwYgkpwulEMQZh@SMW015318>
References: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
 <20260815-t603x-admac-v4-1-1149e342dcb0@chaosmail.tech>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815-t603x-admac-v4-1-1149e342dcb0@chaosmail.tech>
X-ClientProxiedBy: SA1P222CA0106.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fa9a9d-d607-45af-4c82-08defc78d81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|19092799006|366016|10067099003|11063799006|56012099006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nTuj6uY0YzwveL8A+t91oK8tvcq7xlAWplrRO7GAMMsmOOIdgsejIPaBvSw1XKJN1lvKgvSgGYW/Y7qePJQ55DGn5+cF4Mu1KxC92OTbN/rmSlb3qQw+x2dlvxlkOqSfkSV8G92XyEHxtaGHWNMqnvv6uSrMfvyhAgcewr+YGv8NTR1fJAeehCoy7xYJVQtm2B2AubkkH0JdvSxWNiWIRM3E3D2OAjRwcK6wubwpMQjmc5aA0Ib8ibN/X0TKePcLR/1I5ZYX3z86z4Dp7GHGMR2yXyDi3V3NUUDqlPVv3YIVbB/tAAVQQ+bWh65H59jgWZWa+N3LW+IIkqR3CnccRy8q/qS1yWVprzcdIh+dLX1v5ZrZNMlzA27wxHJG+8UQCpo/FbqJ6wClAIp1ybsHkoGDWyGr2bakNRju23QDMIKNVxmSu4xOw2r2l+MmocE2qqJU3/cp2FClJynda+aDtidp6Ajk9xktIhtX5nf80wiFSG2m7Ivme4msHkji9zjpAg+O9LrsT29DGOKDX5fC9VFXO1PvyJZJRfIM0ktRSL1QHikPN5eqszsNdtawVOPxZZ9UV1XKKje4ieaUNcwLBJtcw+7QwBqdx+grME1PADd8uezdZOgy5WRMa07PQOpeHo0OOXis9lt3iO0CDlKLFzm62Tov34e8ETyrtNyB1Is=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(19092799006)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vIdzqYZQceZYi25nwtOusMfhVhAlW2NPenDdtMUcFhWL+WgQvn0VmTKLggYa?=
 =?us-ascii?Q?OCC+WN2uNlWaT8fWCZio7mmJQuDOrH/MBpPiJjOEwQJlxZgcipOLjaKQO2dh?=
 =?us-ascii?Q?SbLXze7YPBqSYD74XpNqPSJyktU1sShbgfTkRna/F/v6LSoLA6y1OBoLPOW0?=
 =?us-ascii?Q?tbcCJDv/Nk3IgrQl0NWrglrjsEr/WkvT4Xoxn3bXqxC7izyBsW6Ap0AzPbj+?=
 =?us-ascii?Q?Z2ATIvlaiq2D+gipKo5zMo8XjPT8xVAADyxvUq67bNySBXgAxFcJNBArEILN?=
 =?us-ascii?Q?6JGIh6kufoh96oQZpOlxBqFYaq7Q/ovV6JenWgFl/QbwgzXX82gMBm/x1KGz?=
 =?us-ascii?Q?LZBkQ+Oz8FRzZ7XSzjwbaykybeS1uyUBk1BFjU9eetSgUJERi/2UCEQyv3A9?=
 =?us-ascii?Q?PldgIBbbRdlsdT6V4SvtpaXjtZLTQ1uUeBEzWNXOYLrhlGX5qA49/7x8MMvP?=
 =?us-ascii?Q?62alusx2nEm04FhHx1qG6oq3QLtuTIgRkzE87OwHvFIHDCFl6R1bh5gjdRxq?=
 =?us-ascii?Q?HrwAWoC9T9pTOw4yMNjsW1HBY4n0ln4XLlkwsVdBnfwUfHYigxVAYA6WnI96?=
 =?us-ascii?Q?tjeR4ZkhcTleIMcPCgBWui3YXvxN/CJOVTlNRwiSBXH6QNIfZsKu0Kal0Br7?=
 =?us-ascii?Q?Ojil/CZktoe/xybO1j+PdxyYUE/ueqTK2w3fmMwd+uBFtNAKw2FBl1eNZ2bO?=
 =?us-ascii?Q?xZYtBI3oMGS4R+PZldKqLRKXHQK45m/7aeUJKtQBxbVtA7u4OCCCciZ4o8JE?=
 =?us-ascii?Q?4nUwxQjhIWiY5mRXxke1sJ7H0diC/3TFa0q94HD8ywzM/mwq7MfZqJNbYJ21?=
 =?us-ascii?Q?PUNUH5fnbDPD7Ao8+FOOz7VV3x50n0n304SsG6DhKP37/x5I8jYlq5bWzanf?=
 =?us-ascii?Q?hgxafuyWGwaLsd2avj7J3fMQm0FwxY2uiFHOunk52UVK/aoCypE+6KtQkrgM?=
 =?us-ascii?Q?opAACRUF4OuNC2t6epDiMTkq94xeVKNYM5VwtFk22DVq17884LbN3cFE9P9F?=
 =?us-ascii?Q?nbJ0O4WHLnpudfGXA+e1fFZMWuL4EkyXHN6Wx+LEz4PITFTqEiFV7mbGoIC1?=
 =?us-ascii?Q?AksaGb1miqt29WNhlCDy3C1qW3Ke05VzxrdJE/FPHWXlAzGOjUwlLFzEJluz?=
 =?us-ascii?Q?lCD04qvnxJz3D+pdLgC3z8uqW62tm1o19acrgBw2/qQNqJlR0zGAwRRAzdVe?=
 =?us-ascii?Q?RKS74i7bvYRYGTw5TWfhNMJSQcIk0IEwf9CCbQ9yYZfxX4npi459TAgzrzOE?=
 =?us-ascii?Q?+E7iWGj3C6se3cYerYJ9CTHiSV+eVI3A30lywP6kCESVgdV16E+oKp5LWXVs?=
 =?us-ascii?Q?bg9G48g1FhAlJ1Q4LF0WVtHRjsNlAYhzSLdlNAgyp8N3ktSaR6rW/h7vNAlX?=
 =?us-ascii?Q?0HnbNKhuA5crLu89oL/6t+7I1cOdTa2J/po1E9l2cDXrrfdU1x/opD/peUkd?=
 =?us-ascii?Q?FKCSZlBqQjhPfVSNpkFZy9EB6H5L2hUZseQzWG91OWE+BUI8MZGi34SrOV4f?=
 =?us-ascii?Q?CW9KJsBcefjhE9FSdCPHeuHq5VXXNLWy9m+0HAVZF3zMV0Q/eyMYTJFrlDNN?=
 =?us-ascii?Q?avJhBmSugipE9t35y5t4oAzzdvGoltEglJrACt92oI3CsNfwK7jBBSjSJprT?=
 =?us-ascii?Q?riFAiGQco/e+jAwULnyc+mBpkMkuXSxY8Ap4QkNP5MRgVeCDF6988fX25c/I?=
 =?us-ascii?Q?mhMgpyGrnqMo8TiB5PAq30qZs90JBSDtNSeBKAyRo+Y3YXZQ8R/gW0Q17deI?=
 =?us-ascii?Q?iNWE2UX55sL1DlqjdmAMMSjcEIHZZrvFL4jl8A8Ic59zUJwwWMjU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fa9a9d-d607-45af-4c82-08defc78d81b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 16:01:48.7829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUJTdkrDGiMeEN8vZF4jdotqfAG3kKSZ4cIS+5WevpVjnpF8Qe3RxJFjO7+/CwQPS6uLc95YS3tCjNxtXVd9253uYjp+9jfLIQRgLDe9EiXfjD2axlSCbiUnJBz+AnjU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8047

On Sat, Aug 15, 2026 at 12:41:38PM +0200, Sasha Finkelstein wrote:
> The admacs seen in M3-generation SoCs (t603x, t8122) need additional
> configuration writes and so are getting a new compatible chain.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Reviewed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/apple,admac.yaml b/Documentation/devicetree/bindings/dma/apple,admac.yaml
> index 6a200cbd7d02..5b4fd8348f99 100644
> --- a/Documentation/devicetree/bindings/dma/apple,admac.yaml
> +++ b/Documentation/devicetree/bindings/dma/apple,admac.yaml
> @@ -10,7 +10,7 @@ description: |
>    Apple's Audio DMA Controller (ADMAC) is used to fetch and store audio samples
>    on SoCs from the "Apple Silicon" family.
>
> -  The controller has been seen with up to 24 channels. Even-numbered channels
> +  The controller has been seen with up to 32 channels. Even-numbered channels
>    are TX-only, odd-numbered are RX-only. Individual channels are coupled to
>    fixed device endpoints.
>
> @@ -33,6 +33,12 @@ properties:
>                - apple,t8103-admac
>                - apple,t8112-admac
>            - const: apple,admac
> +      - items:
> +          - enum:
> +              - apple,t6030-admac
> +              - apple,t6031-admac
> +          - const: apple,t8122-admac
> +      - const: apple,t8122-admac
>
>    reg:
>      maxItems: 1
> @@ -43,7 +49,7 @@ properties:
>        Clients specify a single cell with channel number.
>
>    dma-channels:
> -    maximum: 24
> +    maximum: 32
>
>    interrupts:
>      minItems: 4
>
> --
> 2.55.0
>
