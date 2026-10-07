Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB54825CB;
	Wed,  7 Oct 2026 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369220; cv=fail; b=as9GQSbbj+EBJPJsVlQpbPMyYps9i/aqZEzqLq4KLMXuBQvG3zBBJdX97HgHITRhuR67JPuzWtF0kPp2iHFXBF13+nM/NnVoMUFGOCV40TjkMYJVOqN7ZCdGkfuuJFmISTLsdTof3L3+ziBzr1nnnSyVs7NFC1iTQh7TnkycBX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369220; c=relaxed/simple;
	bh=FvFlBalRAW5+LWt+48Hvwwy1rdTwSXlXFxG7mbHCHPc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNiAW8ly52auVkHIEH0HiwCSBcBvfbuuRN+6K4OXSAeh0Kw3m4yDFb/qlZrVWj4iVVjj8Mv4DlAXS1Ld7BnVfZp2VyZ6OVhacy87laMjW46qCMaIvhr3QIb2D1VycGsg2jqHyWMDJsH+jduwdCpUP7Y474KvK7fuUdSIK8rvKYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=F08FVfeJ; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=FjSKEQKB; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="F08FVfeJ";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="FjSKEQKB"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6977jk4l557678;
	Wed, 7 Oct 2026 05:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0kqITujIspP7T2Kn4JZJPSVuyCz+bA2q+seF+F2+p
	us=; b=F08FVfeJDrXNpVkoLOhFB8csGgwlhTRRuYEG4cu+xpPY2fsJ+wJ7x3JOG
	lbv4i15pL2fIrCdVmJNvUrZB3jhQn7qYFa/lpClZREPqdqTxxMtlVfxWuCBPeVgJ
	Mt+65/4MXIhVkZuij507tMNKyP9kZiIVZpOrXkgEqn73mw2R9fyDKJovskPvywQi
	VdcvtRePklG4KJ4wpsW0EJFJHqi+1ZYM8Hkpm+34Jo9xNBowp7gFZI5wpI2+9W6X
	iLT1eOC8zAH5uNIlO97EIX2F37snU5T0UHJfDwRDwUiQh+SrDGAZ7+pFjXfP8TMx
	OJzSsPGbZOpRnU4Eapry8fkS+U/Vw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012065.outbound.protection.outlook.com [52.101.53.65])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h54a6w2d9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:31:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2MUIq8/SEQ8bY5QWTr8do99BxRF2Xkb+G3Ed7N8xUKkHbcAr6oe5xwGpdbyF9UwmKodwfItoJSIYmvvasVDZuVxFZUfizCIDXbwv5Ge5kF1RxVaNapqc9j+AwewaPClG4c8rrMLwgyOi25sBW0uw/1BzLt9Xzuubs5yp0a/ZGqSGMXskAPkBRmzeYGjvXQyUGUiPYh2Dp5xtJ2nO9cNfADPJumfjEkBKXbFOwi0w/bpMPB4FE6LOwOsI9OyzA5OwpmnFcl/uK5vktTGhln/CDrKEAny9l3HtNkSGUOWjhfipKcnrunzy/Rs45HwRbpfIYOFLQdbJRCK14pIGCo6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kqITujIspP7T2Kn4JZJPSVuyCz+bA2q+seF+F2+pus=;
 b=WN+bGjb5wwfNbQIb2ljN9S7MPmaRdtM8BYfZDrneZea98Lwxc/gTQ4MWBo3RjCzzCguvYhtPr1O1FG0asfEhgAFbJtZZMoe5usJo2porPxE2IPbuHmFEKj/umseZ2ODg786k5PjFKA3ebMPTnofKXsBMtMZH73dxag0vt7YLWpjgvxfNaA3ile4HYs7W0nc6SdZWqUfA0K45VpF31CGPnj1j3RQvZjWwvVr5/5Vr/y0NfJzb5A4CF9NHE5CKF/M5fFW8TwNw3jCLOjs131jOOa5EvVmv6LyKKfsKmym3zIVzTpc8UF/cBdPdXJBDObbEROYFjR1EcEcGQKPRTOSRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kqITujIspP7T2Kn4JZJPSVuyCz+bA2q+seF+F2+pus=;
 b=FjSKEQKB6UbDmoyvGFxaLSnZ4Xy24YjuP7vDjlyYfbTS9DdH7S0Rk4uA2aCh+Z7e3Rdoh5UhF8y7RPsB7S2iMFYQhHmUBnmb6ZG3wN5p/FFNGtaNNRBWUm8xjC5tpFHvXtPjehAhkMtrPN+AtvuS+T4Ib1HzeW81ecpzMHqQ7Yk=
Received: from CY5PR15CA0187.namprd15.prod.outlook.com (2603:10b6:930:82::6)
 by CH3PR10MB7332.namprd10.prod.outlook.com (2603:10b6:610:130::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 10:31:38 +0000
Received: from CY8PEPF00000053.namprd05.prod.outlook.com
 (2603:10b6:930:82:cafe::87) by CY5PR15CA0187.outlook.office365.com
 (2603:10b6:930:82::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 10:31:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY8PEPF00000053.mail.protection.outlook.com (10.167.247.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:31:38 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:31:22 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:31:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:31:22 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiT4013473;
	Wed, 7 Oct 2026 05:31:18 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 20/20] dmaengine: ti: k3-udma: Validate resource ID and fix logging in reservation
Date: Wed, 7 Oct 2026 15:59:01 +0530
Message-ID: <20261007102936.2402427-21-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007102936.2402427-1-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000053:EE_|CH3PR10MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 23889f65-c1ad-491b-965e-08df245e2b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|36860700016|82310400026|1800799024|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dOAyMd/Wi31fk0V9BQVkIZOgb67d0MzX4/PeGzhgZxYU0tXujMRWez2izXnsB4FiQQZw4o3rSOavsBkLaUQ2NfZGeUu8gID2gNLWpuw+do8wBqIqw5vo9rzqBkHmkb5lBbhKUxxMMF7/FkCXLxu6FqMJquHHPzH8Hn4FgcvrODHbLjsCiebWmS+EgJqBPN2e3izVhjum+2tqySkjhw/Dom1xPh6bavT9XMUfSIIK9C8jQvI/RhisvyEouL+pIk7rgjfgVLYpjC1mJVe0p5nICGzv9FazAIW3aopRgEr5OrMZQUBLpDJr82pD27RHtvr1XEMbK974tDznhwOj25Xd4WAWJYDOt9op66iTme4AQRPtyTwBcPu5m0Rbs7RQittpLCHeZol+DvfN+5g/4sYHTa4oaDGunbbePYxOmk1G77CsZdtS1eq8jruZkL+vuGMI5dHZQZVGaLXEPNPI6fWPGulJbaweA7Yo8TIbLjHQC0eAWjFAj+459jPij/8IiaY6cjEHX99mqw9d9tlFLmO0qCFSP1V+1epDzMkYVFEhtmUik/BwhcDhAc5oeSNyw7yDrKblRveZPCjwHESbQ3PPyEpuL4EIcwYTq2ux7Wv5LpSb7GT6yQEg2TCfCvUglxdukpWbXBemKA2DTHrzGQxu8w6GYcdBkWy9xGxutnDKVdfWO9BQHO+IZk6eXsF4p76s63gmVB22fX2nCFqVl1k90S/oNdpQSsOf2DSKiXQZeQ0eKizcUjoZXToTHDFRbXzp
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uDTlYuJuB6pz530bdqW95Yue8Tn6n7lTmzp0D0xIZ7w0jYnEghu4XCQyWHXC7lZgsr/evgNuhtEw1CsMkNqFx5BewVIBtGo9lRCnTZFY5KMNcmccsawe5e9HqyOVrUn+S30m0DLKBEk7oD+rEeYHLd4QI3lFDWW8K16AjTmr6GHjyJxwlXSTOrEKjobo0NppoV1/N9ji1+49E+/s0OCUd1h2dFkz3ilX+EewJc9i8T5n00xVbtpl1wrzZ3nfewH3GP0rqFa091XCO37QmTKO00qLogvXEp+IROKTJygGdrF7JQND2pjFByoULIFMqaichQa/qzkCHupQtQAqPYKw1EBgHRA4r1FS4x/9ZORbzuZBAqVYzCnu2Q45/3kfZL9jd47v8QDgXoj1YnQXKs5W2C1T8TCj13wPFz2AMs5tNt535kySdyu/UIUWmbgBxgCz
X-Exchange-RoutingPolicyChecked:
	rIWmQoBxqJeZmTs+pBaa0TEmveizMShS4jBsjcuLdh75Xl46balfU24Unews9izRr6lWyN6jBAHiV6jUVQnoULwlmueYV1VwtINc0ZOi6bRdkrw/90lshmoRn9hOiUOZTokX2Snt5FIJ/nJ8VJz2QXg4/XiX1HDjWxdijn8nCBjnky3DiO1mS5TCRHWgVze2eCap6vg90VLDnHtoOH31l9Tg2RdRn2w5tD9SqlsINaYqIyWlYVpsobmVmKjwghAEoS7oPbLWePh7CjvWr0iIz3HPxp2TIQ6YQoqqZtcBJj3JfcQVqplPYCAj359xf7H3kvVPtxf2WZ++CepTzJLwuQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:31:38.2537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23889f65-c1ad-491b-965e-08df245e2b63
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000053.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7332
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX9NTcqpQcw9F6
 WzO7bsg3+tBfoYi4+SrQWKeamU9J5v7ncddvU8WFtvWcsKYlrTt5Zk17AajmNzllEQI7LN3r0M2
 gBwQFCLN6r9cPwdqEcbf6mVbe5Im9kSJYKtdzxi1efeonIDf2orVR00VRfOOi1y2Y5iHuTTIIUa
 IPuGLkjsBJGlUdd0lT3aL2G5jVVBlEQPa1FhZlzrSEyI9PG9EKD65/DVY1Z+UZBur6P8/Curnyf
 TDcgO6R+WHzb7X3JubQz0zc2jCaGPo+x3tZ53pT0TbMbKEU9ATX8zLzrK5XUOtS41YHhVb3VytO
 Nv45M78L4mADH93WBq/1yLt9I1XFlI/TroAyIlEM1V3GuPyooW7P0GtL5pKI36NBZQdir5p2t8I
 4nysq5ep6EvgBTW7iHdzYeP6+CoKRrMaHGp9049APnrTE+SaKz37ie99dNRS0M06GZ/ygzlBsf5
 P7kQkHhjr73k5wf+DuQ==
X-Proofpoint-ORIG-GUID: l3762glJBtHHs8c4_Qq85M8HolU-EIVq
X-Authority-Analysis: v=2.4 cv=U88Hnuru c=1 sm=1 tr=0 ts=6ac61f8d cx=c_pps
 a=MDD208LlbW4bdEb8q+7A1g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=awo6gdX1Wv1SqJAOH5YA:9
X-Proofpoint-GUID: l3762glJBtHHs8c4_Qq85M8HolU-EIVq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX5vX1cOqkX8WR
 RaiWG5jD1uZTr0Lw0yqBQfqQILy2bwZVk+cQg57esmI00TmCafvVlW8KKLoORqFK13gyfSI1ECe
 yoKRLAD+0UYZM+YvyAIye17VDlkVLCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

The `__udma_reserve_##res` macro currently lacks a bounds check for
the provided `id`. If a caller passes an ID exceeding the resource
count (`ud->res##_cnt`), `test_bit()` performs an out-of-bounds
memory access on the bitmap.

Additionally, the macro returns `-ENOENT` when a resource is already
in use, which is semantically incorrect. The logging logic is also
broken, printing the literal "res##<id>" instead of the resource
name.

Update the macro to:
1. Validate `id` against `ud->res##_cnt` and return `-EINVAL` if out
   of bounds.
2. Return `-EBUSY` instead of `-ENOENT` when a resource is already
   reserved, correctly reflecting the resource state.
3. Use the stringification operator `#res` to correctly print the
   resource name (e.g., "tchan") in error messages.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 846c1d72eaba9..a22dcaca754b9 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2046,9 +2046,14 @@ struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
 					       int id)			\
 {									\
 	if (id >= 0) {							\
+		if (id >= ud->res##_cnt) {				\
+			dev_err(ud->dev,				\
+				#res " id %d is out of bounds.\n", id);	\
+			return ERR_PTR(-EINVAL);			\
+		}							\
 		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
+			dev_err(ud->dev, #res "%d is in use\n", id);	\
+			return ERR_PTR(-EBUSY);			\
 		}							\
 	} else {							\
 		int start;						\
-- 
2.55.0

