Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794364777;
	b=HFbNgKCkaxhdp3M5/PFdVhjuAntVYemFwblzG7uujWv5ekWV3Lzwj0rCCgim6k8ddGfk
	 W8Jre7m/rSY391NsKfsImBztlxmRxhp1YAXbw9UA99IVUs9xeq1LzX3U1nPwvWzubfF8d
	 jdGZN1Y49I6wYjYEyLrheR0pbECyUd18Rx+nAW6Zue1IfaaCgcKsjBkRL9mTbDj2ZkceE
	 qUDgJvDCx7SO1xRFn008R92/dic/2WdcfnJ9/dRACLyb1Aml+TK5K26p1m1kra7vT/tRq
	 S3Hi4bTXnc4XTypwU0UVyCMK9RubkXqzq9OlR/jGLBlIiTl72CepUp9bihW3Slp/dbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364777;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
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
	bh=ITF7aOCitvr+lRmF6e/p6EMWlQVzGrE/09XeCYr5kv0=;
	b=1kwm+tQrci3JWiZZLgiLg8DWivkN4hDuuc19MR0BHOI8WRtZfaJY8YmszFZGO0XsqMfF
	 VJLUT5Y47CXRJhIzHsCpbY9VKb3gFsT5KMf7ZVcZqH/mIZIk49SLw7N3OIBXHA51f6S9b
	 K9fok2fmri+gJZaoCQaRLxZNrmEYIL/3DHRcenxCZexAMNoZRx1uFA+Qbw/4CBbCEF8BD
	 IuB/CBLrBL4ObucoB491ju/yL8o4NoDiEIyTQTOC4WMMUA/zkKyN8cvEuZWRqOhBOfn2T
	 e2XvGlMBVuHJYGzbrSZfm9mfGG45rZRoriL4d1ZjWM01DS3KMHCzX9I59NhTBshoanQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=gObCM+IN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.49
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169F606A320;
	Wed, 11 Nov 2026 02:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4169F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=gObCM+IN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiNNLLX7W1EEEhFm1NTRIC/RBq72L7BzY1Mct2jrMIzi8jkjIq1QB0MC28wMpne97zW+VvKa/nIrj3EuXjnbDb7LpKZ2PRA1lX9ymdgG09feEQ2FmQkP/E3reRA4pJrQghcjarzr+1A+rA6uVgLi8m+BW1wgFK5LaOluKngYvcQWDSYRxKDeCbCDZBF26cPyTP4tWhBqwYFbY/ZQIabGdjs525TU2vwkkER44bBoFFPXeZxyZ0lbTr2bNc56lD8IAofS01c6YWBQSHELKiiN1LsWqpJMTk0oThos1HvbZ2bdXxD6gRgE+dG//2G+NJiGN1Qr2IlHCSo5e3NXSYOq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITF7aOCitvr+lRmF6e/p6EMWlQVzGrE/09XeCYr5kv0=;
 b=t9saLAB5tSjK3hijruagvPWKRwt/mEdXnL6uHILF88nWcSMS4uXqiB/cyEmv2YT4SHGsrscwODjB9ON6MGSqj8O1iAsyod+YRraQ4nZyeZWK2ubIARQ9SJJJsVYE6Omg2H3R23C7vHpLQTkPZDDidNgwy3yNAhpxpGPdHPl5OdoSj8ohy1vD82lmf6bsRIQLJsBEKJpSCIbzCTeboK7wu9x2AXJ9Vae8hawinhuAg3kbds9ZuJatrR9P9Y9D0UrVWmUJK9i44A78t1UPzsPd9/H3ck2UVjCxW/9OWPJqZVMU2+0qsyhbQG9uiyW1rI+edwcGVCFBWPjIWyFHtez+lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITF7aOCitvr+lRmF6e/p6EMWlQVzGrE/09XeCYr5kv0=;
 b=gObCM+INtZHpaSR1aLVe+gV+agxQcEqOEV/LlakvtGMGMJzdzoFpdW0QPC8l96WYPb1nKWADFujIWgkh0+IATRJvnxVVqDte2Ntr0sbp5UN2AC9bzbtAgATo5K92JXBBBB7lyYzboROfgahKiUo7WKsYzTjJddkKkKzPm6atgQbiBIEiKCGWpCDD053sh/3RtkEEP1jzS5OwSkKb+NIHDU5XzAT6g84MH0E1hyLZ08po1sgmRJHTCwk1AyCPBGijogw3v89OYf8ujavXtjYHZ92eJD8aW0x0uYDmyhqC6q+zT7nyNPvAzgbTfrSbLnRru/b78zFDdvjEq3u54i4Iuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by PH0PR03MB5688.namprd03.prod.outlook.com (2603:10b6:510:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 02:39:32 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%5]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 02:39:31 +0000
Message-ID: <026bdebb-741f-4954-b700-09e08134304b@altera.com>
Date: Wed, 11 Nov 2026 10:39:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 30/33] dmaengine: altera-msgdma: use channel BH helpers
To: Allen Pais <allen.lkml@gmail.com>, Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stefan Roese <sr@denx.de>, Frank Li <Frank.Li@kernel.org>
References: <cover.1794315350.git.allen.lkml@gmail.com>
 <cdab3a18232b5371f09f3df30ab855e3b4ba46c0.1794315350.git.allen.lkml@gmail.com>
Content-Language: en-US
From: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <cdab3a18232b5371f09f3df30ab855e3b4ba46c0.1794315350.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
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
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|PH0PR03MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: bd3588af-6707-4598-8375-08df3f9d03e0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|10067099003|261022105027099003|261026140227099003|261022075727099003|261028144727099003|261102124527099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|4143699003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	SYvG5rIpP629zWWhbrsB6AXdEB1ydbM11kXBYKETapg3LHZKUDbaPNkVVY5t5GIR5o/4CMK90gVUvwCDKZo7tE9hwXX0YdkmQVTzOTkozCOTtwjqdygPkg6NrAxofHFMuJkIzN6xk/RXzzBzQbCYZWSS3nUOh+ZSkYBKMXOchR/RU8ORLkkPu1MW8z/LwENz6qclM7pK68Y03DwAr9AhBX+Bydn95HiXqv75w4kVOOf5vIiItljwHbei3uHikpRcEEu7SkrYXDR5AGQLQ3Z/ChHzkC0ubn9smPOc0VsW2Kf/ileo0CLeqw3B6YnZRFd7x5dW3hGXoa1QfjcFqKMT3aS3LMij6R7cUv3mOssClteJzX1bCdM08qEUb5XrWVoukKCCXaLzVDGCHxQtV/Da514HEHZenChtkswRbrlXEtxd65MTD+wUUlL6YbAsmdL8wZh+KPQzVTTwPtQbO6PrUqtWwj/tRlP16bsApYHtZJ45Z4zNvs2VnEO503afykOfKIOmvTXvq7zrTIyP7+LW3HD4MASfKC497oANr3RrIcOM7vL0vVXO6kEXJ/XcImH1xG+qq1kC3Gzscsy7VYFwBNi83p5PWBioGIf2x4V8R7kzp4gA5q5rtoDxF6EspJaq1/v2PhYn6QTqZlGjGgo0E/hKg9b1xLP6olI4/0DbJcc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(10067099003)(261022105027099003)(261026140227099003)(261022075727099003)(261028144727099003)(261102124527099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFNkSUVKYndac3V0dTlKK1N1V21lV1NIaWk4dCtKanZZMENENjFoTEhXSHM3?=
 =?utf-8?B?V3ZvS1dhNlA4NUE1RGFvQkppMGpTRmRaenM4dTdDYlBYeGJUOVZyM2hLdmw5?=
 =?utf-8?B?d3F1WTRBU01DYlZHUUdSVHhHcVBHR2hKVFh1Um5zVlI5cmF3WHlpT0tDNG15?=
 =?utf-8?B?YkVPM05hYUNOcFpwK3ZzUHJaTy9qeGkrM1hHQjg5YXdua01HZ3BheDdaSW5t?=
 =?utf-8?B?M3FsRUEyR2dnUml3QmUxa2xMNDA5U2lSaXNpcEJHSHRqL053L2I0NytwaU9R?=
 =?utf-8?B?UmxqdnE0Y1hpTTUxUE5JcEplbjZQNkNvSnlZdk1mTmNEYXc4V09ObDYyMTJx?=
 =?utf-8?B?dk50SWZKOEV1cng4Y0lCYnlYVEV1ZmxtMzhPUWxOc0Z2SUZDVmtuaC9DeXdM?=
 =?utf-8?B?RTFGeDlQT3B5eTd4clZlSTNpVi9WTmp2Z1R3Wk5xY0ZhS3pBYU5iRlovQS9I?=
 =?utf-8?B?TVZVTDZTd1p2aVlhRnFaM05YT0FGbXZnMnN1UU5jZUpKckUwd2E3VWQwbDNZ?=
 =?utf-8?B?cC82d3ZPaXFjYjI1L0FxWGlOZHEwbnpDSlluOFdib0h1R1VHZGJ1TmZzWFVR?=
 =?utf-8?B?NUZLaTZhdTgzQVdHM2NMWW9WblNreS85T1lQUXh1WGJ6R0xKLzFybTFSaG9k?=
 =?utf-8?B?WXhmeTFsUmI5SjN6SjJ5eUhHckxPdWE4VnZiRmJrK2Q0bEZSM0xoazdxdElS?=
 =?utf-8?B?Y28zY0QyVGZ6WUF3RGNaZ3FxTVAzTTFDdC9USjVqOW1oLytZdldjb0h0MDcy?=
 =?utf-8?B?YkwyMW1VMnplSzRpM3NQS2Q5NW9sSzd2TzZacG5ER291ekVHSUQwem44ZE9l?=
 =?utf-8?B?NkRLb2FRNi9TQjFDNnZuOHJiWlEvYk1lQ0psVWdEdkM1c2c5MnM0bXQ5WE5v?=
 =?utf-8?B?UGRqNG1XQ2lZTUNLRUZ6d2xLSVZOeHlDOTRmcmJrQ0NVUm1BdjNPV3czS3FY?=
 =?utf-8?B?VnRvSG9sUUo4OWxteXJQSlJrL2JndFY1QXB6Qm56S3hWLzdqcjdXV3JnTko1?=
 =?utf-8?B?RTB0SXJuL2JLek50dnlnQTV3SGRQYmswdlBDNzkxNlFjZ0lodTdYYnovUU9P?=
 =?utf-8?B?b1B6UHhTU0lhT3VRWkFaK0FOYWVjdkh6cktYREdNQ0ZlYW9mTnpNUDlXMDhW?=
 =?utf-8?B?Y1ZRYjRkOTNkTVZjVm5LeVozOXlwWFo1TzVNampxb1FoSUlhNnpGZEM3bWZr?=
 =?utf-8?B?NTAvRnBKUUpBLzQreTVDTFVZUTVnVWkweTB1cm5ZckVyVWp2M1p1bmRvYVo0?=
 =?utf-8?B?eHlvNjlHd1A1Qjg1bmRneUUvQVVLbjAwdmFZaGxBd0pNbTdvWG5rWnJFd1hX?=
 =?utf-8?B?M1JiZmIyN1lHQWo1SXRwNUh6M29CbS9GRktGcG01b2kyaElTMzJPSUkxT2RG?=
 =?utf-8?B?TGtnS3AyYlVzSDdqQ1YyNW96amlvc3h4ck9nbWlKTG9iTWExL1JORWJERFN4?=
 =?utf-8?B?ZXI3Q0FFME9CbDY0R2F4WEZZMERtV2ZKeDJqclIrR05aekUvOTF4dW9ObWdJ?=
 =?utf-8?B?OWVVUlljWjBPZEltUEp2di9YZHhaQjlQanBmOEFTQ25DSThWRk4wZUZPdlBo?=
 =?utf-8?B?aFE0bVZRN1lPZnFZRnJ5cS9GRE5vKzI0eG9nZVlEOFhtQ2ZUMlF3M2w1VzBM?=
 =?utf-8?B?eUJMRG5XcXkvcEdWbnpwS2JMa1Z4MmVHTjdQYlhENnhXWEVzSE1KRGxUMFQ4?=
 =?utf-8?B?ckR3L1I0MmFsTmdTWDdmcUw1VDNTRVd1VVRZTVRmTnZNc2pGaDZXR3hZd09D?=
 =?utf-8?B?QU9adHhBWmhUOEQya25ESlhpL0Z0N1ZGd2s3NDN3K3VVdGFCUVBWbUJGMUQw?=
 =?utf-8?B?eWRGU05XdGwrQ2xiRC9KY0xlNHY3SFppa1JQb0pmb09hZHd4bjdCc293bHRT?=
 =?utf-8?B?V1BTREJYOXMxU0ZMNWRGbk9WeUlHb3FtSVZrZ004V0hFYXd6dmgvSXlFVFpr?=
 =?utf-8?B?Tm1aQ3RzdTBrVVMzNGJESlNkdUxHYk8vcjhYeVFzdDZLVFY1UDEwUnFMY0tM?=
 =?utf-8?B?a3VPNFd0U3hFSFhLZndaK0N3VEJtYy80dlRUQ21yKzMrMGM3RmtzeXBaOWlv?=
 =?utf-8?B?SHE3dEkxdm8rcTNhNTVqT0ZNRmtLdXErYk9iU3hZaEwzSWVhRzNhV2c1anlw?=
 =?utf-8?B?Nnk5QS9oS1I1b3ZXVjJCR3ZIUDJmMWx6Szg3a3pIMlVyNEEzS01vbGpMRmpq?=
 =?utf-8?B?RFVVeDc1SGJQKzRwKzBnUmxWWnFQckNFNnFTbUpnWjMydnZnREpMU1UvZVYw?=
 =?utf-8?B?dUJFQXZUV2plTDZPanVnQjdoeVJCMTdKb096Yk5JUEdtMTViMDVQVGg0V3Uv?=
 =?utf-8?B?a1VZaUdVYzJ3a05EZkdTVFgrVFI1TjFFQUpPcjhvSUlHSzljZmxEZDJRdUhY?=
 =?utf-8?Q?c2kDJ17JWMQpcK14=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3588af-6707-4598-8375-08df3f9d03e0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 02:39:31.8463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBh+D4g8IdXK+pVTrx9fUODM3gadbCLFrRLgPGNIUUJ34WYraVjL2+uxEkdlvRbxHSIUIhzlNN+8dO4V5jDICuO2KkjxfPYLZY9xfvHcjgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5688

> Replace the device tasklet with the per-channel BH helper so completion
> handling runs via dmaengine_*_bh.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>   drivers/dma/altera-msgdma.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
> index 567aea0fac38..9a0741642a7f 100644
> --- a/drivers/dma/altera-msgdma.c
> +++ b/drivers/dma/altera-msgdma.c
> @@ -170,7 +170,6 @@ struct msgdma_sw_desc {
>   struct msgdma_device {
>   	spinlock_t lock;
>   	struct device *dev;
> -	struct tasklet_struct irq_tasklet;
>   	struct list_head pending_list;
>   	struct list_head free_list;
>   	struct list_head active_list;
> @@ -684,11 +683,12 @@ static int msgdma_alloc_chan_resources(struct dma_chan *dchan)
>   
>   /**
>    * msgdma_tasklet - Schedule completion tasklet
> - * @t: Pointer to the Altera sSGDMA channel structure
> + * @chan: Pointer to the Altera sSGDMA channel structure
>    */
> -static void msgdma_tasklet(struct tasklet_struct *t)
> +static void msgdma_tasklet(struct dma_chan *chan)
>   {
> -	struct msgdma_device *mdev = from_tasklet(mdev, t, irq_tasklet);
> +	struct msgdma_device *mdev = container_of(chan, struct msgdma_device,
> +						  dmachan);
>   	u32 count;
>   	u32 __maybe_unused size;
>   	u32 __maybe_unused status;
> @@ -748,7 +748,7 @@ static irqreturn_t msgdma_irq_handler(int irq, void *data)
>   		spin_unlock(&mdev->lock);
>   	}
>   
> -	tasklet_schedule(&mdev->irq_tasklet);
> +	dmaengine_schedule_bh(&mdev->dmachan);
>   
>   	/* Clear interrupt in mSGDMA controller */
>   	iowrite32(MSGDMA_CSR_STAT_IRQ, mdev->csr + MSGDMA_CSR_STATUS);
> @@ -766,7 +766,7 @@ static void msgdma_dev_remove(struct msgdma_device *mdev)
>   		return;
>   
>   	devm_free_irq(mdev->dev, mdev->irq, mdev);
> -	tasklet_kill(&mdev->irq_tasklet);
> +	dmaengine_kill_bh(&mdev->dmachan);
>   	list_del(&mdev->dmachan.device_node);
>   }
>   
> @@ -847,7 +847,7 @@ static int msgdma_probe(struct platform_device *pdev)
>   	if (mdev->irq < 0)
>   		return -ENXIO;
>   
> -	tasklet_setup(&mdev->irq_tasklet, msgdma_tasklet);
> +	dmaengine_init_bh(&mdev->dmachan, msgdma_tasklet);
>   
>   	dma_cookie_init(&mdev->dmachan);
>   
