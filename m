Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88092211466;
	Tue, 22 Sep 2026 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059828; cv=fail; b=nS5gOrsBAXEB0Eil88suHvvuhbZPv73nJ3U21S9u4dw53OJo7+ZzQEeJmGU01J/suqSxpOjakiWvuEI41uDwhGa9EhphR7QmiBs2VxYoTTX3+2KpMPPvvhevoUMBYbsJKiJ5yVvcb5YBuoCiuFWGzsBEsQuix3qjhzkSnuQqBfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059828; c=relaxed/simple;
	bh=dD/rsHsFBpjNGtyELuHpnh2tpYV+yShZHEqC8bX3qLo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jw7Bo5i58KvARr6wCBJriHo8989qR9CR1UPSW3MkxdvIi21VxCgCnDpWwntU6O4qOgVDrkSw3X8U1gmi7Jmp2NbStLIKkZGIwJ9sp5Y0W5y/SuzZnASyUbde/fIrjDhytyUha26Lx7cdf4bzQORKZQwlT76ay5WeNGNap23gsbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=XVb3oYN4; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DZeo5nqs; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="XVb3oYN4";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DZeo5nqs"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2UKos1034864;
	Tue, 22 Sep 2026 01:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wnd7uUCK8Gj6RW+b9cimF4nYF7gX+Lhr0xbdaWpzZ
	Kw=; b=XVb3oYN4GcHp3Kd/204T8go+z6+h9lZxPzKSn1UZlS+H9FrunUyOvj/mY
	Ky11w/RXJopS7LSXxOyO9vmBaoZAGbNgY9F5EK96Hqvbo27InVY+DOXGKnX1iCUF
	iIy82hHo0bssAteGGfkA0MZVMMsokNXXyFGOwrpU+Nkl8njhPRvWVNvBiwCAXnug
	CvGf2tHI3JUJvtdKkyUXnYamA+4pNyZsxMXM8lOrxnQdYOmeZ/+DYKDEFKozuWhF
	2dNXWg3BB12va+RPZ5GZXUP6k1Q0nlnlJyyXWjTCgI1HBAL40ISZFGuGgm1zawhf
	12SF9sllDt+iyj1TU4G7vihsXNdNg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm16k4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:50:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfSGHaj3dIAu2ookGjKBgyhD22G5MDzd/nbBoW96Ya7Bh0+EizzFlvO06yUGwJAi7xLIj9bvNFeZkhSb6Q9KbQVkYeCYVXKVafMPOvdMrlHCl4BhgpOlzPOQCfLW9zMEBBu/V+ayGt6oAWn40zkT6v1mLfvD66zdzjTJrBI+xn/hRgD34s8q5A3pEAx1BmH2qz7Jabob4KHrOpA7WFzvG6TXYJfaqlJaMCNSq/dD2dFxZKgSjwkfJUwIWauBBF4N3GDaaDwOLM4FxVgjB+pexXQD+Fdn12yeG0+lLYjd+j8UMX8tVqoCU7Zx8u3AQPQbsgTa9CEwNtm6jbl2MiJ15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnd7uUCK8Gj6RW+b9cimF4nYF7gX+Lhr0xbdaWpzZKw=;
 b=SlTge8aiJXdIYpxYEXIALtdz+mWekkQyhZ0TINwJo3mo15wtC0Hm7GsfqLD0wP0qGKh144mjFX0E+Ar0UfYc7HvfzH9yXUb+D8CwFcUHJSUQIKrxCIWdfdJKqRqKj32ZhiPOhmFBTQVKn63lcPxCszs2fyD/55A5BtVUvDtbEBR8PMacQJuyh2JZ/oiD6Dxp55Pk/jdyJtDJWcXTTyp8JxXoNp9MqHhTLdudlGjZz0ADJ5cHim0XexU7uJI20fqMSMetMTYtM8ZeeScDLERJpGFTQfDsDN2V58o/sBv8uV/1HfPukYyiLqpAEbalakMnjZ5m4qxbOJt8nuDAiBFfjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnd7uUCK8Gj6RW+b9cimF4nYF7gX+Lhr0xbdaWpzZKw=;
 b=DZeo5nqsBjDaQNws8XupAYCVhoAO+r/nsMfhd5uexTmDXhn9PI5TJLfDoYJ4sXrA6tcTgYlJGMzgGHlUkKjRb0kRR76btOR8mQwk2l5caP3+0PfCl/Nqk3eZ7/sGStHkB5Y5SVqQMlLqvosKr1Tl0PcOSCIfPHqmk56LBDYfMTM=
Received: from SJ0PR05CA0109.namprd05.prod.outlook.com (2603:10b6:a03:334::24)
 by IA0PR10MB7275.namprd10.prod.outlook.com (2603:10b6:208:3de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:50:11 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::88) by SJ0PR05CA0109.outlook.office365.com
 (2603:10b6:a03:334::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8 via Frontend Transport; Tue, 22
 Sep 2026 06:50:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:50:10 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:53 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:49:53 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI3w3626771;
	Tue, 22 Sep 2026 01:49:48 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 06/19] dmaengine: ti: k3-udma: move ring management functions to k3-udma-common.c
Date: Tue, 22 Sep 2026 12:17:30 +0530
Message-ID: <20260922064902.2719979-7-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922064902.2719979-1-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|IA0PR10MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 064265f6-9a93-4d86-9b96-08df1875bf1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|23010399003|36860700016|1800799024|921020|6133799003|22082099003|18002099003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	/ePmWrHwZYqQ5yexg1sbUorT8PgGkuuTQlaA5l1WP/U9Q72z6h8WRM3XNyxBwUvQtWE/ZrI6hCUDLCoreY0bE2SoJdDlwDQTJZrvCgc+UF+kjj1JqCKjtnnc1IPWUwLcz60PQG9wlXG6yqHM5afWG11MqJipo5p43DdJRDtM8A7HiBvkX7vZY8yP0yV/W0RIbW1sXmtsbRTPDYH6VZBOXSNT0RbPHynI6iCOE+XKmWLDCNpoR9OEcAdOVcf7RAvP3hmhyx27huxrzOBEW4+WjOzMxfyfM6oYiA5FOdh1a5JB+DhUIZq2cvbVXQOsa+NdLapMwAJYoqsAF6TcEe1Rki2zuxa7XS59Ue1yp9lcICfMXDgDRy+M/QBTHyvYl6jkBFwwRX4hu/UyFKPPPN6J8Cp4b9rEG4eZYsw9NgqWcF1F/JE8fIiHVaQfr8zJGQzexil8ABf9pShKD0HPwf+ZHcQJKnBTjZyln+boQ8Ujw//7w7GPVwyfqizksxBzXZ93H4E2uvmHAXU8Uyrf+1ZW0/9VTjLjcRKniGT82Rt0JuDV71kwLQgoU8a8iP/8ADHucLPYXi59EGkkz+e5Dpq7HP5Za/d5xaeDyJtX0/PFshY9T1kA7A36vBDiRD2JfBsQctezM8hTZbz94vJxWuTCWX+Cpxv0mzTUypTbjDi+Pan1ncLEjAIkTU/M3E2vPYHmnesd+N4vIU5RESDja7Tbnq/vJLteBzChvMa6gfs93pEfm9mgWKaExC5xOrJ16ESz
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(23010399003)(36860700016)(1800799024)(921020)(6133799003)(22082099003)(18002099003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c4Mp0rDs+3Xg1x5jfDsnVhzNTmOsFZuSraBgXLu6KNSjid9ceb7n7oRYQnk+IbxHn301//Ep4yw1uuhFm2RtxRrVE0mKwVdK4pcI3HADaqKc1jcLuQBL6KL4wW0kCdPICPdNuglXM3T/JCE9qQDswG0Z1xe3/3ahqU83ss0diEOOwREqUN+jitO9Jf2EtPCqLs6ObdOhcFgHItNmkC4ljV84iwobeiWd5aQLF4SjOYCkLfmv8/MfoWJ0OwZdb/Z9QtlGNgvWzfnofKtl9o24RF6iL+1Bwy+UH9B6p/Hrww8ViRrT5GP4RDvjBaDGPf7IyGnRtlhD0w5l3DwsAEk3+eMqAXfL7vOM76MPnv4QeiXWEpJI/wKfoSJwdKV191PqmAkpZNOETVuOQ5MhAlpJV5+k/VboyktMGhKvozew/oMK4zkyN3/+qP1Gfi9iYWcp
X-Exchange-RoutingPolicyChecked:
	Sqo29AcpbJDXcuK7+RykAUNkvMT34BVIDaRXgfLNxRAtqUutwIfP31C+900FDeMap4iPFE4XPbNbNvprMsL4DaqBSXzSST+7OWebUIfhZENxWHg7VTAmWzafljJR96ZnYY9CJvxlvnuNwRaaDR1Z9hpSfUR64zDjFqfkqV1uHN7CquEIa8dLlGhmBmsPubctNgK3dyHEYB/+twcBEt1+1Ivj+5xPP2EkA7CaH1yQJigEi/UtmwmnNFCbKca+xGBAqBKml1u2W+rzGgvF4tfkvS7hgVhosdx/oGMZYfsHTGeS3+j37isYdeAh/Batp76INkOPD+RUZJ7VaxQX4Rpxdw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:50:10.5058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 064265f6-9a93-4d86-9b96-08df1875bf1b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7275
X-Proofpoint-ORIG-GUID: Ruw6aIrcaCJULdBKbAs8FeJ1ZXjeEO11
X-Proofpoint-GUID: Ruw6aIrcaCJULdBKbAs8FeJ1ZXjeEO11
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfXz3i9fJUWgApP
 jcbWjOYNdD0JOKHxr09lT81Qu9TvpBEiHXMJfT1MlqS6B//CpResm52kijP1Thyx4Fv803KrDoq
 ta8Jh79KWPDhy2VMrfbj1IowEOJBWF5OvpkFWz8bP8mSDLkuklPiOH5D4YTPIYaslsJ4VrzL+uV
 qChVDb9elmzoXrXW2eSFic0vAuq0rvfAif2ARlwxhrubWdqwJieAdpUlFrw29MSDonsjqxRQw0/
 zjzhWfrnjcVQnr27NCAjWVTDn6uwE9Dwzw9u4TttV+tioUEztgdvt5QvjR4QektjgkdQWS225G3
 rT+j4gCNAGFP70PNQZz+7Tmd4waOyy6gByDpsUEPnCV2Wz+XnqhMGnVeCrrd9nGMbWdL8OHE/uA
 CnFNPUICYJ6X1D0U+gIDi5tYimu1DgIW258wa8hMuKvZuHVXEKhncvXsHM0Qgu621edoXKJQ1pv
 9Iv+idxiELq15LGf87w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX9JP10agG7m7y
 FBuf9CgBg+rUwhOX8QqYge/QzhRwVmI3DMFKarCIPIYUYWZ0lJIlmsfwnmOwS5BYNbeu4oBo1fM
 1hr4FMdD+sQyWVd+ryEptSumZdqPwQM=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab22526 cx=c_pps
 a=Q5I7zFPfgszDbE/a6V3qwA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=g6TaX78G5PB857Cctd4A:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

Relocate the ring management functions such as push, pop, and reset
from k3-udma.c to k3-udma-common.c file. These operations are
common across multiple K3 UDMA variants and will be reused by
future implementations like K3 UDMA v2.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 103 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 100 -------------------------------
 drivers/dma/ti/k3-udma.h        |   4 ++
 3 files changed, 107 insertions(+), 100 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 3130805a8ec40..3ec5cc932280c 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -1239,5 +1239,108 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 }
 EXPORT_SYMBOL_GPL(udma_desc_pre_callback);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx)
+{
+	struct udma_desc *d = uc->desc;
+	struct k3_ring *ring = NULL;
+	dma_addr_t paddr;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->fd_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->t_ring;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
+	if (idx == -1) {
+		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
+	} else {
+		paddr = udma_curr_cppi5_desc_paddr(d, idx);
+
+		wmb(); /* Ensure that writes are not moved over this point */
+	}
+
+	return k3_ringacc_ring_push(ring, &paddr);
+}
+EXPORT_SYMBOL_GPL(udma_push_to_ring);
+
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
+{
+	struct k3_ring *ring = NULL;
+	int ret;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->r_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->tc_ring;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	ret = k3_ringacc_ring_pop(ring, addr);
+	if (ret)
+		return ret;
+
+	rmb(); /* Ensure that reads are not moved before this point */
+
+	/* Teardown completion */
+	if (cppi5_desc_is_tdcm(*addr))
+		return 0;
+
+	/* Check for flush descriptor */
+	if (udma_desc_is_rx_flush(uc, *addr))
+		return -ENOENT;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_pop_from_ring);
+
+void udma_reset_rings(struct udma_chan *uc)
+{
+	struct k3_ring *ring1 = NULL;
+	struct k3_ring *ring2 = NULL;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		if (uc->rchan) {
+			ring1 = uc->rflow->fd_ring;
+			ring2 = uc->rflow->r_ring;
+		}
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		if (uc->tchan) {
+			ring1 = uc->tchan->t_ring;
+			ring2 = uc->tchan->tc_ring;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (ring1)
+		k3_ringacc_ring_reset_dma(ring1,
+					  k3_ringacc_ring_get_occ(ring1));
+	if (ring2)
+		k3_ringacc_ring_reset(ring2);
+
+	/* make sure we are not leaking memory by stalled descriptor */
+	if (uc->terminated_desc) {
+		udma_desc_free(&uc->terminated_desc->vd);
+		uc->terminated_desc = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_reset_rings);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index a8fe919f307f6..6a731fcfc0697 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -174,106 +174,6 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
 	return false;
 }
 
-static int udma_push_to_ring(struct udma_chan *uc, int idx)
-{
-	struct udma_desc *d = uc->desc;
-	struct k3_ring *ring = NULL;
-	dma_addr_t paddr;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->fd_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->t_ring;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
-	if (idx == -1) {
-		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
-	} else {
-		paddr = udma_curr_cppi5_desc_paddr(d, idx);
-
-		wmb(); /* Ensure that writes are not moved over this point */
-	}
-
-	return k3_ringacc_ring_push(ring, &paddr);
-}
-
-static int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
-{
-	struct k3_ring *ring = NULL;
-	int ret;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->r_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->tc_ring;
-		break;
-	default:
-		return -ENOENT;
-	}
-
-	ret = k3_ringacc_ring_pop(ring, addr);
-	if (ret)
-		return ret;
-
-	rmb(); /* Ensure that reads are not moved before this point */
-
-	/* Teardown completion */
-	if (cppi5_desc_is_tdcm(*addr))
-		return 0;
-
-	/* Check for flush descriptor */
-	if (udma_desc_is_rx_flush(uc, *addr))
-		return -ENOENT;
-
-	return 0;
-}
-
-static void udma_reset_rings(struct udma_chan *uc)
-{
-	struct k3_ring *ring1 = NULL;
-	struct k3_ring *ring2 = NULL;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		if (uc->rchan) {
-			ring1 = uc->rflow->fd_ring;
-			ring2 = uc->rflow->r_ring;
-		}
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		if (uc->tchan) {
-			ring1 = uc->tchan->t_ring;
-			ring2 = uc->tchan->tc_ring;
-		}
-		break;
-	default:
-		break;
-	}
-
-	if (ring1)
-		k3_ringacc_ring_reset_dma(ring1,
-					  k3_ringacc_ring_get_occ(ring1));
-	if (ring2)
-		k3_ringacc_ring_reset(ring2);
-
-	/* make sure we are not leaking memory by stalled descriptor */
-	if (uc->terminated_desc) {
-		udma_desc_free(&uc->terminated_desc->vd);
-		uc->terminated_desc = NULL;
-	}
-}
-
 static void udma_decrement_byte_counters(struct udma_chan *uc, u32 val)
 {
 	if (uc->desc->dir == DMA_DEV_TO_MEM) {
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 62c15b0cc9ae7..767b73021390d 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -614,6 +614,10 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 			    struct virt_dma_desc *vd,
 			    struct dmaengine_result *result);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx);
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
+void udma_reset_rings(struct udma_chan *uc);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

