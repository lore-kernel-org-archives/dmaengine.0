Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3932DE6F8
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787139587; cv=none; b=clW8ma1WB/L26GMiVcH/tdzjQ0HSMe1NnwRENFyhlbYI8masO/snGguxABPUTe5Djfv02a/hwAKojrScH/uU/emw1kDXycKQ7W79lCLYpr/Fy2jYr8SRFrNIxs7UzeMkbmkvsmbGHbz1kKodQUp/EzvbvJXrVC1JZqkGQp1I28M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787139587; c=relaxed/simple;
	bh=irQlA4VB6MrKpyPrAx3ON5PAm5M8QLgUS2BFdKiWRFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tE1LFoyXtl7kBmzTXbA1Ap33YBkymZBeTDgcmdAjpQK1G3cHqubOAaubVgDspawN6cNL8CMxK1E3AKU4A/olxrDnCbgk6u8ONABiOngpXva4Gk0Yzc5/DQxWU8jdKCSf1Mi59/8owSnB4QKxkBnZzG/UVnn0lYHrVBzBq5yDTVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=By7a5PI8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRmvoL3b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="By7a5PI8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRmvoL3b"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8qFD3730688
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 11:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9d9QMcKt7CfxKzePmcEFNZ
	5MHmCGVLdquRaEvYZAHho=; b=By7a5PI8+jPX7CHfVOC2M9RbY7Yk13OnAxG1/V
	diDYwA33dYhGl1HgvfDiI0jt/5Yw3W530ppyyo/WQQhywYSOoGrgVVsfK2SkUMPN
	SEsTI00GLNsV2+5pszbD6Gw5KtS5yt+CR1IfYx+Eh/iqvYaFPTEOnx2tyHt+nd4L
	LHPHEhbinsm4d6DcLQ1PhTE9Ny01B8LrMYZ3npts6jdnESLuhO1pzYxbtqsY4X+B
	3Vq0lpoGJw2wV1Yr26aGE/XxURYSsBfYqt4l2sl20BJ5jSA8G6K4Dx9VkqenF+GL
	oh17C8XZgkXtgEnRFR7fq0ictwxovemgRfHiL/eF6kgpkDEA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmayxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 11:39:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedfa3898aso904016a12.3
        for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 04:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787139583; x=1787744383; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9d9QMcKt7CfxKzePmcEFNZ5MHmCGVLdquRaEvYZAHho=;
        b=JRmvoL3b0icOlfMqUUDlrz8chUGaMZDSh6xelpcby4U4pMBmnn1dyFUBlxGKspCu+w
         PxvaL4ja2X+a3hPQDOHDuBnbiW2R1o1Xlmzat3UUjdX68zdQyCTM3myJLrbkTMAmH0bb
         GifdhTmpS9jaA25WnR5+ROICL0to6WXrPam9Xx4Ulx60z0otRJUpxO35yPb+tRa0Rm79
         /WvVQHVVHSng3w7d5TLKe4vm3uq1Cl2cfJB/3nv6Fc4f3+UgxK5rdV57nluGDDb80dUm
         Z/fQCpjPwkBz5cDwY+/jC2T08GznvzO1nDNSIgYEeasbNSEi38IQC4y41+zBynyqrY35
         4/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139583; x=1787744383;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9d9QMcKt7CfxKzePmcEFNZ5MHmCGVLdquRaEvYZAHho=;
        b=PftmDuDzlvPOyzd0lBvtjZBDcw5uEq5kx1zOf9T4d7MFIIFNeTqFX0BZHOM/SBSKq5
         Xomtk6mfx6q88kL7e3KLDX8DZOC8xpje31VE+7N52gnLx9XK4jnQMeaRXEeGg/FGQkqO
         JP8yVVI6m7jCf+CZDSqYzzwaiDiFdIygAq2a6aiLfb6qA7IHFq3JkqQ6icuG9noaqgCj
         I30mSRcMXKaZc7hEtFubch5CjtozH1znJ94sol8yO0k6JceEAEOtv/ShhF2mPEcxJ5iV
         H3hbqittD2D1S/OpqQiciEELSP/H2XOoED+RLXDO/jgHUrDR6tnny23UGnqdSeBpffI9
         TMqg==
X-Forwarded-Encrypted: i=1; AHgh+RqlatlGI0xiQh4VFrLgCnlUfDtjSIGzK6SQB6bO01vLBy7bjjklRpzM5jKa/ZbccXRlEAX2BfHpxB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzE40NHvlzVxVLkg3gZ5dkX7lfSq/pTDCJsHVxwQIzeprpCGTP
	5WXyQYWdSKZwcyDgkGdxqom2N2xk2O8MpkriTo+ee5nmnxlz17tVCSbK7BElmoSYhXQdNqFzxam
	Kmk1X7yFhdJfRm+/4Xro2AZnF9Y7D42unkJ3/Sl4MHXy9huJmkk61SI+O2p3d6yk=
X-Gm-Gg: AR+sD13ZPHMChba41fIrX+hhMqwG1iTn8hAG8WvBA670IUMLpIC7CAKx2U3bByf4Ofq
	mx8Et6nYpNr4eRBchuQxK6zsITy2bw+I4pM0vtaJKcleEAVz46iUoOE2Wk2PcRNa3sGfJ/c1gan
	b01TGmKZWFe/gTihbd/Q2xr9dsoSbJfOtkIWn1AtjghddYt1zqE7VsTKXo9vz5IK9Y25FQ+PLYa
	qgaZ6Znw2fGOnBnirJtRx33+BO0D6rQrTl2s4tkzhUFeZ7WYk0BDuyIso4htVzCnmUNoNR+6FYn
	9C6RoC9MzyY4+dQTK0iiIwAp9JT6DOHJttgmOzKCV0b+9Awv2zcxMntIcEadGwFhJ5AWnZpAM0s
	CkDbgHYPL7Yg0Jyb2N3pqOh/EwS6UEgLEQXI=
X-Received: by 2002:a05:6a00:e05:b0:84e:909:ac03 with SMTP id d2e1a72fcca58-851d38eea1dmr7132651b3a.10.1787139583348;
        Wed, 19 Aug 2026 04:39:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:e05:b0:84e:909:ac03 with SMTP id d2e1a72fcca58-851d38eea1dmr7132567b3a.10.1787139582782;
        Wed, 19 Aug 2026 04:39:42 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d336291esm520408b3a.12.2026.08.19.04.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:39:41 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:09:31 +0530
Subject: [PATCH v3] dmaengine: qcom: gpi: Fix resource leaks as part of
 channel clean up
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-gpi_bug_fix-v3-1-4c97333e6f5b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPKVhWoC/1WNQQ6CMBBFr0JmbcnQWgKuuIchhNYBaoRiC0RDu
 LsF3biZ5P38/2YFT86Qh0u0gqPFeGOHAOIUge7qoSVmboGBI08xQ8Ha0VRqbqvGvJhClSE1IpF
 KQliMjkJ82K7ll/2s7qSnXbE3OuMn697Hu4XvvZ85wT/zwlnCUpRSivysVZMX1vv4OdcPbfs+D
 gfKbds+Zj1p6b8AAAA=
X-Change-ID: 20260803-gpi_bug_fix-b0b80ef315b5
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787139579; l=2630;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=irQlA4VB6MrKpyPrAx3ON5PAm5M8QLgUS2BFdKiWRFs=;
 b=4RuwqGXZX8n3BoaPz8HR0Ef5YoLuXJO2T/dDxTLUzMJCWMoRmcP6osNPwNBO+t+KD/C8/AIF6
 3tRGmfGlAJTAX0MUYiOEs2/zXyvAmE+7ZveEDjsCPIF8K13THxpAk1K
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5MCBTYWx0ZWRfX9m6TwpNNidTq
 014QqIdqJZfvQF91LTyIJqyO/Jaet03fzU0bND+cz7Hwv7xDmCGyg6/ygTHrn2bTsNKEdcWLTk8
 uv88404hzGNkxLMHVCP6HeZiykjV8d53qktg3pjUxN7zooh05F64AQeC1XrKYp2gcj6xHq+qaow
 1CEXWlDiSgUYL2Iw80/pP9EN0RW5wn5xG4TL1tgGMWdYKpL/IcWDthgiTOwaytpE52s1AkUU2ri
 /Lcjo6qC5593dZQbNaWW+hNcw25KI/aomKkCSDdh3CK6QDMhZEzcV+KGRWzsG/Fjwpd7KLdkBnX
 wOZtWeBwRBYyn7JEowV9g0TJwEWM+JrfMz+6T5DGVQQlsRNuwYm6ifXHy1u2dTDe54UDALeI3z3
 Pyrwvx4Z7dATKx/GboHgb19M+W7j4lbWjhKcjzn9TXwSQG5wcXDaOm7a1/vS4ja0hLzjOKY23VG
 FyqScTx7e/vxChLhDYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5MCBTYWx0ZWRfX8iQdyg5CbfbV
 dMDy6F8poEUMKlpCuN48ABo92ywzFQxn1T++MluFn9q+IPSzqin6e/CMKMAv6+0cmh4BpCOe6dq
 N9PUrlIBufBiPzK3JOYVDa2m/6XeCvU=
X-Proofpoint-GUID: WJmA7mI4ixS4Hc_3iPBnGnUJAM0SuNLK
X-Proofpoint-ORIG-GUID: WJmA7mI4ixS4Hc_3iPBnGnUJAM0SuNLK
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a859600 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6mmPj426WQFTegYL:21 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=u6FzXYu4T07pN3TH9GIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190090

The gpi_ch_init() error handling paths do not fully clean up resources
when channel initialization fails.

The unwind paths iterate over the original channel pointer instead of
the channels stored in gpii->gchan[], preventing previously initialized
sibling channels from being properly reset and deallocated.

In addition, gpi_alloc_chan_resources() allocates ch_ring before calling
gpi_ch_init(), but does not release it when initialization fails,
resulting in a memory leak.

The event ring cleanup path also leaves the PM state unchanged after
freeing the ring. As a result, subsequent cleanup may incorrectly assume
that the ring is still allocated, leading to a redundant EV_CMD_DEALLOC
command and an attempt to deallocate an already released ring.

Fix the unwind paths to operate on the correct channels, release
ch_ring when channel initialization fails, and restore the event ring
PM state after freeing the ring.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
Changes in v3:
- Updated the commit message as per Mukesh suggestion.
- Link to v2: https://patch.msgid.link/20260810-gpi_bug_fix-v2-1-60555394cbf9@oss.qualcomm.com

Changes in v2:
- Updated the commit message as per Mukesh suggestion.
---
 drivers/dma/qcom/gpi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..c41bfac65ddf 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1965,16 +1965,19 @@ static int gpi_ch_init(struct gchan *gchan)
 error_start_chan:
 	for (i = i - 1; i >= 0; i--) {
 		gpi_stop_chan(&gpii->gchan[i]);
-		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
+		gpi_send_cmd(gpii, &gpii->gchan[i], GPI_CH_CMD_RESET);
 	}
 	i = 2;
 error_alloc_chan:
 	for (i = i - 1; i >= 0; i--)
-		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
+		gpi_reset_chan(&gpii->gchan[i], GPI_CH_CMD_DE_ALLOC);
 error_alloc_ev_ring:
 	gpi_disable_interrupts(gpii);
 error_config_int:
 	gpi_free_ring(&gpii->ev_ring, gpii);
+	write_lock_irq(&gpii->pm_lock);
+	gpii->pm_state = DISABLE_STATE;
+	write_unlock_irq(&gpii->pm_lock);
 exit_gpi_init:
 	return ret;
 }
@@ -2065,6 +2068,8 @@ static int gpi_alloc_chan_resources(struct dma_chan *chan)
 		goto xfer_alloc_err;
 
 	ret = gpi_ch_init(gchan);
+	if (ret)
+		gpi_free_ring(&gchan->ch_ring, gpii);
 
 	mutex_unlock(&gpii->ctrl_lock);
 

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260803-gpi_bug_fix-b0b80ef315b5

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

