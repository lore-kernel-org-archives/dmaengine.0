Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8A9424D5A;
	Fri, 24 Jul 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888597; cv=fail; b=DB0TIZBHSatO0eScxAhE4ZZvrILFk8VvfEdn/KjwPLcRnWu9v+CXRHa4yv2ZqMajCDAPVSjHr2oyXcOW6r6iuUPLeU7ocxDPFkP4dmMZtjXFds97/xT2rZsUHeVQnppv8X4Q+S14PPzDv+57p6juWG7P8K43F240YmUX6K+UUjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888597; c=relaxed/simple;
	bh=WJontK+Bl2iHifrWgjwlNaLl6bdOw30tbco2EvGrv/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SOGWKOgtziozp/h92RWzGNsdsN/lA8ufOfv9LwuDDjDXo6G+zpnTvmYlCHGWDRL5iyx9UPzoOcWDJ1hOrYmpOqcwVeyWM2rYp83vIn9IdMz6RP26OW2hFTkOCYiJznEWzAAm5xeP2ud4WqU69GCpd4olGbPt2LWacjj91onHHeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=d5S9TTzk; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FGZ4wqnQ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="d5S9TTzk";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FGZ4wqnQ"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAFXAO1093822;
	Fri, 24 Jul 2026 05:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=F6oI5zrWNdRH+dqAwMgP5Nt5I3TeT9+rgBgkxDJXC
	Mo=; b=d5S9TTzkRFD+FYo1c14XipfPR7UF/uRKXbcF7IaA+l5NwY4VmwYCqtvwq
	CviMSs7D9cQM9wxR6zYk4Z1T8K97DJmSghAKkRgsgxNEvMTCkA+QDPphNN6ydc9S
	WJYwzEOUqfhijdJJIW9aFN8W3naf3DnE0wx/RpwDms63kz+VmK2pJGbfJyXJDXop
	lefQ5pNu/RlKzJxVv+IHa2uNll+hDxG2/Zj/vqZsXJiL7eUaXQ/Unf/zmYLKY510
	4D0tV5IC7A0oba9e8Dd6hCl/unFdHC8WHgYXHAubOPJcWjBLC28QK8a7ZgjM11fr
	FQHKnlL+8p44aZ3nC2YlH+Uub6LZg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010052.outbound.protection.outlook.com [52.101.193.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkyp7j40m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:22:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MX5BQWj210eivS2qZ53Mw4cVWJx6XwRumjJu4JG1urusoWS7/5/VjeZ656bnyxhDbXtmclS0mzQxMZnBsuMjbB+ymwsZGJEuod4rewk4d/gjqx8G+GIJUreR76CHtLXEZCYSVOJtq+GIsXQCFQtUdMDPU5G79SRlB4sc8s3vSSz92xvmVIpR5om+bFKmuTUdUHyAj/tUnrulDkkNxjXl4nyHxRAUXaG6e3eS8OEOPg84lPhuHCB18sb/WP/g7FU+bgEY5J7nDlntFnbYKAUXF0CscCggLzo7TzmLgFYV7wU+MwuJdv2kW5TQJ+n+Tcd1LJQGJAhyxtcKpyJ2WJTVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6oI5zrWNdRH+dqAwMgP5Nt5I3TeT9+rgBgkxDJXCMo=;
 b=jgeAUb02+IBhpCX7ImMeI1uHvr0ts3Iai0X+9ooOZQAUrPLUIV7flr1QVSb1YXe0wpEmYd0H3fDvynTSyPadxPfbFfbJLegkTJ1yVxo5NfCEuUEK1UNTv+CGso/4mG+5oFmyvfpvGXmtetiBhfFe3huO0FaNqVUX29eigTDMeJGq6osNOreSkZG0WBr9u+X161UOg8ML5m1lMolJRSqfICD8ZvRFdROYA3wb/+iSCMM0vmPBMUMbqtZg07keDZXMFM+Nna/DON8AfDiePE25gD/8lKElWV1Phy0bNh15Z+GCBJaPSj1ZRUhpVFW3MFpsOxXQ5pqRo0e6nJ0RJ5uRqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6oI5zrWNdRH+dqAwMgP5Nt5I3TeT9+rgBgkxDJXCMo=;
 b=FGZ4wqnQlXnHt0oBlRFo6PGRfKw24yH0BT62x36kJEM4MWX0snF5c/LRx6qaXP1F5unVBLX3KMp9ZT8M+YLJpJimtOSXxqAieIJIh9ZhAh7ZRyHukqUnSzBkEERxvZeTmh/7qGjHI4KEJFZJXBySSI4i4s6qT7zvnf89HbUXfNU=
Received: from SJ0PR05CA0174.namprd05.prod.outlook.com (2603:10b6:a03:339::29)
 by MW4PR10MB6654.namprd10.prod.outlook.com (2603:10b6:303:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:22:46 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::46) by SJ0PR05CA0174.outlook.office365.com
 (2603:10b6:a03:339::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Fri, 24
 Jul 2026 10:22:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:22:44 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:35 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:22:35 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFS3017088;
	Fri, 24 Jul 2026 05:22:29 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Date: Fri, 24 Jul 2026 15:50:46 +0530
Message-ID: <20260724102115.2854-14-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724102115.2854-1-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|MW4PR10MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1dbee9-e494-434d-d488-08dee96d801e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|7416014|376014|36860700016|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	/ZMAWRMJvhqT+Cb3Nmx1KPjhJ5+go/VeAFoeu9yeLmhpT5+NtIDaIKo3bqJXJa1YrdsJT+m2atxTH+cjQV+Db2IMnSfujpVCumWQeCTGKC8YHswLq79CoWE9wc8B2zCdjxBGCbr88TvG5vI2C1VpnIgFyuR4k2YYwCRVgJ4mPfJUlxf0Nxl1v0ssbVBTua7eIP68091y6Wei1rKvNFIy6hsg506dzsHiu/kONM8Z4l51bz4WEfZdcosh+hrtoBqkP1RTRNwIyEiG5CAcWBcjRy5l5dMG7VHNg1UI9xBdp0B6VH+/ENJO0KI02402y4J69fIR1CzOGSqw6z9GJHqcq1BXoWgARAVtCBe28JpcIdJcZ3QP+1Z8xBJgzvJ7VD9Be59WV5DfRw5hvV/jaTpxZoFtlM0tVBfy60uqiIyNZjp3nYlQs+nDwDGa0RwFyUcqtmMsnIENUsFJmzRhl5cqV2ed9B+mkQlHGcTPwV7OLLsnwocyc67NZHfWUK2+dJ6EVZ4BDjSNoIxfq0cxbD0Co9AvsltNDjb9svL0PY4Sz0lKYZl8J1+fAdt8866h1DwV7rGn3QXkRCuONKodYpwT5tjwRfzhxMmBPpYafiQZsuYDmfinAhUZ+8i1lY1pzfG5Evi/QNv4QJKTg/fL9UwUTnToP9PciG5PYSckQ6avt9tK9BS+juxdl2A58BS3QDad
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(376014)(36860700016)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YAGB886YThdmGyit+Qo4GU8bdiRHYW8vfBqcnSRq7Nf9TrrNillep77FOTJ36CzTlpHjZvSzZsF/JG/EzoiV9qquwsrw9GML+W8p8cprHfQlCYWAeAkLk35cu7hxSpaUeZ6s8H/81JN3GButyKH0+syGi5RByebPyeQdZ82VsEyXa6paazfWn1UjjFG/P+koOmXYR86AXnGp118rrtL0BPU7zUUL5krwH4MGRN36YukCjP7OpQDGuhdd8OEIj6Ao/2npZKX3gW/Ye1JzQgQV0UaHbVBw48ZIyUE0FwWT3IhyzHR6D26KRHGbYp8IIQBt1M9F2brwsU3psc8y2WPTYuJjBR3YmN63sgLDdMj3Xy/Cz+F3Ozn01drA75AG0djWuAh9wiOCc4LuNSLBZvwJ+2xz3tvsk6aIcbdd2pcLUdqY2BoUYLbNfhlkcm9AeseN
X-Exchange-RoutingPolicyChecked:
	bF7EmSuqtO+h/5sOK5lVTtOVz5zy68jzK1HBRy4g9VwQb+dZX47LABwJ0aoESIQFMelvbFd8BmA1Zu93aV7u5+/57c9SI969oQF7wQpy174Dpyu5NTLbTg8qYatt+6WckKSXIi2G+rFcUH2+U0ddmMnvW5mCthnjqyBp5WogQjkIEb+GFf5d9dDmUcDmcbkcaTE11OBxo1WcyeGD7WtSLU7D5JANKoE23lvir4EfUwKDPFw+miyL3XwM9Fz3rCRvVvRIds1hNM4xPgEJ4OF3QLZ9ZaIGYir7Tk+qdJgHUuAWNAw4bSMK7NyUgd4P7Nl6XSKdFj5lLnazesIqcOT5gg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:22:44.2100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1dbee9-e494-434d-d488-08dee96d801e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6654
X-Authority-Analysis: v=2.4 cv=M4p97Sws c=1 sm=1 tr=0 ts=6a633cfa cx=c_pps
 a=N8fQrVaeAljVkTo8kKJ49A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=hcTNyZL6kbs_FXLRU4UA:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX4pa7aho7bsMG
 oAt8yAVLdukpsoL86OQPGNmQK1LOCulbz6QennXUATzlB/kYYwHhOt5xk/YFWioAjRiYwv425Mp
 GPn64xuYSH98+t4loB2rrcDbYEpYG/E=
X-Proofpoint-ORIG-GUID: y76i2jtoKnIka8C-osD_fIZOQFuGBjHw
X-Proofpoint-GUID: y76i2jtoKnIka8C-osD_fIZOQFuGBjHw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX1QIICrhQBZug
 dIzV7f7P6+ef9N/YrUhJOvmJoqv0BtmWqLTVLzz8BuA3nsAZgtvIVo7vI2gF0HopXsLG4BbVr8Z
 Rgk2EkhTwnHKEnz9uM1QdAcZLhahC4wAY6Mnc2+7kBh15+OCSCg7/FQjjzQddzQkDmuTtmiX8lg
 8DewUzCL4wTiBEMSf8IEzaT+cTJxTB2kv8hEcT/cot/6xGhfJfAwG7ja3RnR+kUk0BR3T1ZGwAN
 nLQF24iBJSCxoOWZfkjSpp/lk1Rxbaru4z4/mWhD5VAJPN4lR0UXb+kJrB/TUHzR6uvXNeoolBA
 FA4fGQ6HKT46f0ZO3iqX1hmmB84T9XqmPg3N+phcWOTWu1mBY++XwFPXB2jPv3MqNOjTwoJAJ7y
 1p4ODaiFSzJBELELZ/robf62nZZ0aQUnnz6KBEy2Iqft5IYXA2F2PaUjR8Ds9vRVKis4cbqcvKJ
 jZIB/TnooaKohwF1quQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

New binding document for Texas Instruments K3 Block Copy DMA (BCDMA) V2.

BCDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  | 212 ++++++++++++++++++
 1 file changed, 212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
new file mode 100644
index 0000000000000..4e676d30e6bef
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
@@ -0,0 +1,212 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Texas Instruments Incorporated
+# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-bcdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS BCDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The BCDMA V2 is intended to perform similar functions as the TR
+  mode channels of K3 UDMA-P.
+  BCDMA V2 includes block copy channels and Split channels.
+
+  Block copy channels mainly used for memory to memory transfers, but with
+  optional triggers a block copy channel can service peripherals by accessing
+  directly to memory mapped registers or area.
+
+  Split channels can be used to service PSI-L based peripherals.
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-bcdma
+
+  reg:
+    items:
+      - description: BCDMA Control & Status Registers region
+      - description: Block Copy Channel Realtime Registers region
+      - description: Channel Realtime Registers region
+      - description: Ring Realtime Registers region
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: bchanrt
+      - const: chanrt
+      - const: ringrt
+
+  "#dma-cells":
+    const: 4
+    description: |
+      cell 1: Trigger type for the channel
+        0 - disable / no trigger
+        1 - internal channel event
+        2 - external signal
+        3 - timer manager event
+
+      cell 2: parameter for the trigger:
+        if cell 1 is 0 (disable / no trigger):
+          Unused, ignored
+        if cell 1 is 1 (internal channel event):
+          channel number whose TR event should trigger the current channel.
+        if cell 1 is 2 or 3 (external signal or timer manager event):
+          index of global interfaces that come into the DMA.
+
+          Please refer to the device documentation for global interface indexes.
+
+      cell 3: Channel ID for the peripheral
+        This is the mapped_channel_id assigned to the peripheral in the PSI-L
+        endpoint map. For XYMF peripherals (SPI, CRC32) each chip-select/FIFO
+        has a distinct channel ID; use the channel ID for the specific
+        direction and chip-select being requested. Use 0 for triggered
+        block-copy channels (cell 1 != 0).
+
+        Please refer to the device documentation for the channel map.
+
+      cell 4: ASEL value for the channel
+
+  interrupts:
+    minItems: 75
+    maxItems: 75
+    description:
+      Interrupts for DMA channels.
+
+  interrupt-names:
+    minItems: 75
+    maxItems: 75
+    items:
+      pattern: "^chan([0-9]|1[0-3]|1[6-9]|2[0-9]|3[0-9]|4[0-7]|4[89]|5[0-3]|6[4-8]|8[01]|12[89]|13[0-9]|14[0-3])$"
+    description:
+      The name of the interrupt corresponding to the DMA channel.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#dma-cells"
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dma-controller@485c4000 {
+        compatible = "ti,am62l-dmss-bcdma";
+        reg = <0x485c4000 0x4000>,
+              <0x48880000 0x10000>,
+              <0x48800000 0x80000>,
+              <0x47000000 0x200000>;
+        reg-names = "gcfg", "bchanrt", "chanrt", "ringrt";
+
+        #dma-cells = <4>;
+
+        interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "chan0", "chan1", "chan2", "chan3", "chan4",
+                          "chan5", "chan6", "chan7", "chan8", "chan9",
+                          "chan10", "chan11", "chan12", "chan13",
+                          "chan16", "chan17", "chan18", "chan19",
+                          "chan20", "chan21", "chan22", "chan23",
+                          "chan24", "chan25", "chan26", "chan27",
+                          "chan28", "chan29", "chan30", "chan31",
+                          "chan32", "chan33", "chan34", "chan35",
+                          "chan36", "chan37", "chan38", "chan39",
+                          "chan40", "chan41", "chan42", "chan43",
+                          "chan44", "chan45", "chan46", "chan47",
+                          "chan48", "chan49", "chan50", "chan51",
+                          "chan52", "chan53", "chan64", "chan65",
+                          "chan66", "chan80", "chan81", "chan67",
+                          "chan68", "chan128", "chan129", "chan130",
+                          "chan131", "chan132", "chan133", "chan134",
+                          "chan135", "chan136", "chan137", "chan138",
+                          "chan139", "chan140", "chan141", "chan142",
+                          "chan143";
+    };
-- 
2.54.0

