Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD5D441020;
	Wed,  1 Jul 2026 13:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910955; cv=fail; b=VUp30H1n+R6XlisZWi+z0EqB2iAOXyBQDmrzHwi/DF639ckW7FNc/0DKwZebYcwxVe42KLcCVygXWjj/Mx8FfpL+WYm5xNpl3cW0lw7LsyoM4YY6lx4MyvmroFo7iuRHUcPOXvTlfbG/ePw3XECp2CG9wwcIHUGdb95WO5ktRsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910955; c=relaxed/simple;
	bh=Ml8+XBwCbsVbbx6Lw2Hr+6HmNT8ZwERkO5pGYSUtbLQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jv3BLYLIq4YGdmOii3vDtD5YLoMsnXMg9JuysJCD9H/9QQxjqlAG112JcfKeWvnnaDEYGB5+nTeMfRpt3I4VW+pKmGJKnFhLeIpGnWp606YYgA/KFOn/lRJCjBb46oh3In6+dbnFcr0ZAhaoLcWQKzyotUOfMO8mNoihVNi5YDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=GkEHnG/p; arc=fail smtp.client-ip=40.93.195.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="GkEHnG/p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjR1y/mwy0L3R/oLRbII7NZbL1bcJvCnJdYA710falkKe2JZM0zSzLZK0DJ1qPXSjkJEGgiy3ypXcGy6AQZ/UF4MmqTJ0ItL+WiCVI7K8/otegf5VmRcvVBJ6y7ELKkq6OYohQqnbvjYFpEnIZkkz9ba3GGIuYw+umqzF3B8s62vjjAtDAz9eVabQfBezd/3o3sBNGLixWL3bvNya6D4f3VYbpv6Lob9WT0XoBOYZoehLjhWtJNShMn9LNVL+ZFZZkyqnYBXjfhzGGoE9HfByls9E6SJd5tREaWfvH5n5Ys2TCD0QGeGtAnmOsa0zCg840gWp/J0mn0ROZ2R+RaW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIgsFVU/IzPNVROtaaEcWwDwMpwfX07hXIfSQhQnPac=;
 b=fGL9IJipmgxG30vVM2I0Cq5q9L6tCgShexvURUHnOMPWxfyQ3/bqd+bgU/pqcJIn7p5slIZz5C4gft866ZqmY/8zUXv4aiIDOFDc3i9bTza7+3WtBMdzcThTmgSA9UU2Cz95PyfvGoWPtd8bcqeITmLZ6r1kdmQ6F0zAOvenImz+01O8vku58VwmPl6DD5F9r7ZTSWVM+Oqf0X9LHKjjBPgvyN+e7iA6P0RmrvvU2ST0+MhHE178dOwOX7rQGV+nNrmfMFjGbJz8Vh7GzH1c7pQbcUA2+R1bBofiUvA5t/OxCPICzoPvAz2Z18gHB+yUtFwDtHJgc+Bjukq4QNkUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIgsFVU/IzPNVROtaaEcWwDwMpwfX07hXIfSQhQnPac=;
 b=GkEHnG/pKlRhzx9I1g4WD8KCcIzX4FJdkPkxMhtD5bS+6AOfz/rxJ7Ab6/Q7ipssd8gI0DRrNc0jY+8FkLD9jLxL2fGi/cfQrKtPgVDc1mFfvVNx+ae8Wu1fw+UQz7szbRmtWltu+7VzzdRFNz5ATCt7p9U0X0I3RGVLtFk2kSy4Oaag0Vlr+NBqK7fMmAXyoTBYcCOk41RDN2X7NtIVlLiAqPw1pmahjfhcFwj+p2DtTU93YohYxT9ARr2vLYf8LpPdU0rdNcn3WAbmIMz6Qr1QZ3Q/5vq6GS0IVKZ2bVmdexk247RipeEoypURIWP4q0e0+e/hIx81VaFU3F/aKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB5942.namprd03.prod.outlook.com (2603:10b6:510:33::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Wed, 1 Jul 2026 13:02:30 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 13:02:30 +0000
Message-ID: <2bc4261f-ee42-4ef8-98b4-f68061198247@altera.com>
Date: Wed, 1 Jul 2026 21:02:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: altr,msgdma: update maintainer
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>,
 Stefan Roese <sr@denx.de>, Frank Li <Frank.Li@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701023455.36330-1-adrian.ho.yin.ng@altera.com>
 <20260701-tactful-viridian-horse-3fa1f5@quoll> <akTOAdKsFt0jxAnh@vaman>
Content-Language: en-US
From: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <akTOAdKsFt0jxAnh@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6d4109-7596-4be5-2067-08ded7710234
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	rZWbItAPlGXpmmnxJhRe+7RUnAZJbYRo/Fcp150/0w4oH++YAshmkrXwq/6t0AmWstuodXQZvKiwy1p9m36hiZzeLVbT5R8JofdKxEcrRuAIU0T7cCntQ+Ilw11czYOZAN0Hmh4KZLIHr51TvRpBnqbdtHclqlouZeKd5m35d1OQaOgcyslEX2MUL/SZz0KTf0gKdZ1BzXLgXtryr9OF3+baJBswxf3+WsNB/bynoOkJyLo29ziLnVRBod/mTZlK/2GM/ktFq7aT02GjlNEAdK/WfV1A24LQQZ4193Mce7ubeaAw5vp8nTQ4HVtMlFwffOuo136eXnQENw5IE5nEq7rj5Ceas9UIFPcjHATlcgzcJC29+ga0KAoAzmlY7FBA48YaAe0KtJXCGjqs+kHklvirLcYYPX5/3Sv7zDQ0OsCl8Xb7w+u3pYHFm2sz0epqAeGWSmRZSPlQsZ1ZLpk18kf6w9dMaXFWUcWqRB1CmJrNdlIVWlo/8bLabW+xXiC6oIC1j76fWXi2Y9qCEZjxcy8e1Q8jiLN6TGuycZSy8BjhR9h/WfVaoa2NajKLMGt0mbWEVNtnliMUkOA8c/npkN5TpCA5tK3JYbPCA9azKKx2ZAvNuQLr+YEHQdNgsJxmduxqOEBpHojDYAZZXL3IbJJLJJ7DgthoesBb9mKTm+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXVPbGEzZEk5aHk0UFdPZGhpZjlBdkhRYTlyeWVkR2Mzc200cVA5QUw0OFIw?=
 =?utf-8?B?bnU3MFRIN1JkcFU2NUhhdUZ4MVZEVWFPZXYyc3RiZFR6cU9DL0FRY1lCV3VG?=
 =?utf-8?B?dmlkQWNkYlh4NVE3NExlR3RrZmNtODhuVG93ZkpCSmd1SU1HZWs0ZFFJcjgy?=
 =?utf-8?B?WU9ISzRubjgzY0FwY1VCcklOQjNmaHp2UURaNUJSMmZKa3FvSVpFNytkOVNU?=
 =?utf-8?B?VldWL0ZDK2Yvb3hHa1JVRjNKUnU4aG9yQTNPb1NHNkRNejFBajFIZnJ0RzE1?=
 =?utf-8?B?VnFON3hvblNQSjZ6Z1AzNWovSkM3YUFjZXF4RElORktEQ1hvMTVVVmg5NEZ3?=
 =?utf-8?B?T25ENThqOWNPamJZaWZXL2NxNVF0NlE2MDhxa3RDTzZXWGpscm1KOWdlWlRB?=
 =?utf-8?B?NjcrRjFvRlIrb2lidmtCeWl2R3MxdnByQUlPdzRXbm5MeEV5c3dhbmdUWWpF?=
 =?utf-8?B?dFU3ZTYramZlTGhCR0FsVUY2RWNEcU5zWHB6Vm5SRmpHbmxMQ1JxejlMV0Yr?=
 =?utf-8?B?K0t5UFl5V2hBVysxdjk2VExib2FyZnkydHg3ZXNSWGVEMC9McnJhMVI1Snh1?=
 =?utf-8?B?QWVuZCs3bzZ3T2tVVndnK0xuQWtrQmRIRHJtOEVIZ3B2cFNiUWFMbXFTZmNz?=
 =?utf-8?B?Y1hSbHQ4MlN0Y0NqempXZEhQL3Y1NjlSUTlvNTM0VnJuZFQwM282T2UvT3A4?=
 =?utf-8?B?dlNrQkNsVzhHdWovR001LzA0WVgyZVdtV2JmaVA5NGVNVTJnWTNia1hWTzgv?=
 =?utf-8?B?Uy9BZXlpM1RNdkNING5LMDIvaXlYa21jRCtDcUxzd29TV2VLYldjR2NvL2l3?=
 =?utf-8?B?ZTlwVEpZWEVLWFBSWndBc1NyakpDQmRKZXMzVTVGUFlYbldqcER3WnlzbHp2?=
 =?utf-8?B?U0lSRGp5bUtxT3RJRXhHR21JTnZOWHNVd2VoOVNKMlBnc0p2bnk4ekx5dHJG?=
 =?utf-8?B?QWFkZjZvRURSVnVTUUVGZlVPVkJ3UUR0TW9jT1FONzlya1crS2dvWFhrMC9k?=
 =?utf-8?B?eGR2dTJLSkltaEVGSUZIYyt1Q3NVTlNSY1k2MnRxM1B3bkNQclpkR0hSL04r?=
 =?utf-8?B?bExJWk9CVnRSRjk1VyttbE45eEtyTU5GSFA0RUtPRDVpVnE4cXhBNzk5amNp?=
 =?utf-8?B?VzJId1dnbVQyYkROZ3diRHpVMzZubDVieFVQRVZXV1RIcHdEMCtJODJmOHN4?=
 =?utf-8?B?T2dObHppS251NE45YktTWUI0Q3AwYWtNb2xxNE1wekI0b3hjOC9rYW5JL3Q5?=
 =?utf-8?B?K3VORURLMEo2Y1NyaU5oYXJyUGNrNHo0cXJXMmp6MllmVzQ3dXdUWVRPaXpQ?=
 =?utf-8?B?aWZ2YW9uSkFQTTNNOTNhdGlMRFZ2MnJUUktoeHRiMTNxNWhueE1pZzN6Y3dC?=
 =?utf-8?B?RGkwbFNqMWMrcjdXZ21nODBadFoybEJaVVpFOHhHR3NxaG11Q3BxcG1sek1i?=
 =?utf-8?B?Vy9WODRYWFh0cmZPL1FOazZZTWsyOEtlellRbGFqeDAxRlpYTDN0eDVkMWg3?=
 =?utf-8?B?VEo5R0dMdTY0Y2x2TkVDM2xXSHlMWnRFTkRjZCt3V3cvOW1iMHZFcHZjYXhk?=
 =?utf-8?B?eUxlNnIzQzMvOXhtRHA0Unk0TElPdGxER05mZVJybTRSWjVjK3g5QU45cUxk?=
 =?utf-8?B?TGFyWTBtNk1ISHNHUzdxdTBKZlVZaEtLemx1VVAzamZUemdRLzZzRk5TYkVW?=
 =?utf-8?B?MlUrcDllcnZ3OUxqSjNEL0hMOTM5QzBNSTY0VGkvMlovSVlWOThtaUp4aFEz?=
 =?utf-8?B?OUljcGVTVkQxQUhOcThyRnN4b0FGMDkzQWxqSXlESlNmaUJKdU9iZ2dRSUZC?=
 =?utf-8?B?akowTDgycDZLTGtVNjRQS3p6SmhkdjlYUmlCWm1zVnhxVGZNeDZVZ2tCcU4z?=
 =?utf-8?B?R1VxWXNabDZTME5aUDZUdG1RK2d3ZWNNNXh1UHZXK2ljc0pQYzFSckZTakts?=
 =?utf-8?B?cEZBaDlIdUVpTmNicDl5WjBtLytEK1Zsd2ZuSGd4aXcwank0RWFIV01rb0Rv?=
 =?utf-8?B?NzQ5SURGV01keWFRaWtzb1M4VHpUNkJyNHA1VVVOMjc2T29XQ1JSYlpBWkxt?=
 =?utf-8?B?eFdlbFd2V3VjUy8xVjh1emE3NVlGYURMdy9hdDNSQk42bmxKYVNMNXg5RGsy?=
 =?utf-8?B?aEhORnBVd1BjdDJ5L1dhRVhlRFFYblRjNHVSYVlTZ0E2M3RyV0ZaN1Y2ZUl1?=
 =?utf-8?B?dnpIYmw2dlpYMzZCdUpnNTdsTnZGVGNWTHJjUXBUdlpLZHpNSUVuSnAxbHo2?=
 =?utf-8?B?eUhiWWkzaThzc1ByZjlBY3RtdGlqMzZyV084aVRoVndQb0wvSTArcDdXd3E1?=
 =?utf-8?B?bERydWdxRW4yVCtqcFY5SDN5ZTBuN2dRWFN1d1JIcWdxRHNiSnp0bEZya1E3?=
 =?utf-8?Q?MVMlOTemvfdfha8Q=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6d4109-7596-4be5-2067-08ded7710234
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:02:30.4648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhatoVCzFbPLboeHghiMKPjM9j/i2khcpV1bEFxJBy5zispVih1edusoetJBMvbZQOaeL7Jqi1w4wliDwKMevGlutJksnjc6JsmIr4MR9l4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5942

On 7/1/2026 4:21 PM, Vinod Koul wrote:
> On 01-07-26, 09:36, Krzysztof Kozlowski wrote:
>> On Wed, Jul 01, 2026 at 10:34:55AM +0800, Adrian Ng Ho Yin wrote:
>>> Olivier Dautricourt has stepped down as maintainer of the Altera
>>> msgDMA driver as he no longer has access to the hardware. Replace him
>>> with Adrian Ng Ho Yin as the new maintainer.
>>>
>>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>>> ---
>>>   Documentation/devicetree/bindings/dma/altr,msgdma.yaml | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> And maintainers file? Don't send such commits separately.
> 
> That was sent separately
> 065e447dc41ea149c900338e64f047575ca6c348.1782279704.git.adrian.ho.yin.ng@altera.com
> 
> But yes subject could be better for both. Myabe replace Oliver as altera
> maintainer.
Will update commit message in next revision.
> 
> Would be good to post both together as update
Will submit changes to both MAINTAINERS and dt binding together in next 
revision

Thank You
Adrian>
>>
>> Also, subject is too generic - "update maintainer" can be any update...
>>
>> Best regards,
>> Krzysztof
> 
