Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695608;
	b=Mx4LxaMo1RaokWs13W7a58QklIj1k/4ksdyr8IQKWK4HYCZiOOUcP/F6a6oxxjJaaG4T
	 F2ut63Wz+uFAz+YNtOoFq97wuxHEVnBx1yxjJIWzHmWku39wng4DTgbydtTLu2gNjIR72
	 C3AncKxVQWY/ZoX3SnBk6hgeGJHdE1SBKWKwyi7ArHk7ubW9U/brJ+KaKWPDKRKxeykoj
	 vD1V+97I+5HLscJouvxMyn5VtlFlD7xFydPba4cKyEaE1mFbye7KR3kQFCtOpQZ0Eu3a7
	 DzBTqVcJCg+nrj0lTG9DmvUXtQXKfdtWYQGgWkj9hthu9SsPFyznmiCSVm3n6GjwR9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZwpN3MWkuJgEw/5lVf5YS3s9N6pKk0wMcXzClzDmDeU=;
	b=BCp2g9BcuFbtJwGFDyMHGreyYf9XGpHsO+a0nwKxD+TwUEagr3rlRXK4O6GXFOxT0fYO
	 +l27Af6yyUNo6rx8LpVqajfZNuZ9oEjXmrw3M5CZ6sLsELEchbp/C3X8KNhQ4yeEEi/hM
	 RZMSF4GMmAl6ewjm5lO83WUSflCFpDdQ1RZp1JcNQM8gXu0mZvdN03J/FA51OS2NxTtBD
	 Djy/R67TNg10yoVVAhQmnvwLYwB3HKIyY/OamAAK7T4H9c+Tut6ZK+4MIVDG1iEQdbdcp
	 /VTuPj8V61VRpLXCfWq7Ei9SQX37st3kfXooi8Zr4kO6VkNjRMjMiil0uGh4W5lE/yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmrLDn5D;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F9606A326
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 08:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E59F9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmrLDn5D
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso2590589a12.2
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 00:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695607; x=1794300407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwpN3MWkuJgEw/5lVf5YS3s9N6pKk0wMcXzClzDmDeU=;
        b=tmrLDn5DgdsgbIctBbIJsfK7Y2GKRlv04AVwZzWIVHmW5P1vliiZbYj/pkdJrN9YIc
         FU/twe4HI1RPmiFs78bzbQvbHNGn4JP883Uin26ttA7z/MK9FrCJtnMHZoxCXCZ9JX5E
         RNG+2684vScWrtFCOyVwj1z2d+Oa/Id82LBP/Pt0j2ljK5xQvFgbHb400AdmWWD4Z9rp
         N0PKe2T7nuxxynUiNBu43cDnwf6QSKRZttd9S8yAWslmyq8teVJpoEBZDTmFWYzFmmLw
         Whkr/0rTzrgEJkVBjWrvJn1lNvef03prOlIqd0tE5CwkMAgKIuPjbHcVKduRu78M/rJQ
         fLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695607; x=1794300407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwpN3MWkuJgEw/5lVf5YS3s9N6pKk0wMcXzClzDmDeU=;
        b=H+CG6hhTjekXi8y5t+aFqJMr2NhLcDI1z7X9pKBnPFO50dP8tgl2eU8KkuAEd0atDW
         hml1PwXimDJQ3SvPcYvUMO8Ytm/xolbUvMv5YGpwztGfFcNgATrETZk3XjbqgJxXlBuu
         FfPcKGrDGvIv4hFCb+JpAAduU6cj2N7j0kIR/he/p7fMML3chrkOq/E0U9McZ7Glgdhz
         qS1wwUxZ+dxu2bEybcJtx1RwnQpWrE6vl1phqgfn2/jm1GREOKGm+9PSPCe297885br3
         c5GsC3uiSxrnhtVxOlkB3dC5szCjV3Cvmp0oBSVzTGIrOIwwxQO41OLMeK1FBl0LASrA
         7rNA==
X-Forwarded-Encrypted: i=1; AKwUvBwcOXUwoRC6Gq7q1AK/v0a0EQthrcsgbNilc5ecwG6c4HVcKmP5JY+IuID8QtemyNLGq1/sPXpxx0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8uyLpkUqmcNYhWeNZewEG9pwsfonQIM8RazRv9iHSi79PcsO0
	UltfpRkRSz8BuCi0BMx3XwvrPAScRVjbl+k0Pkk9pt3cov73Sx28EEik
X-Gm-Gg: AYBFou3PzksAuriSVyT0KbR9eLSoLYBoK5Y5vjVyR7005WFFvnvQtblzf3y27Q3+XhB
	Z9tzCQhxiJwvjbud4uqpfLHB4CES3i+7FNbW714hcaZzKxyyKjPIEnXXpDxoNX+jHLYJAS6Jkay
	rGezcJOblKiz2axCNxcngCbsJD2I+cuw1hUT5P8pAmcAruhXAs0ieBJUQ5D59xvN/iwBzyosVQm
	jUxDZzdLdUU0RVQXebTJ8j0wyXrnec1i5s3FbtPNIb+An2L9oTcyg+L7UGIbRlAVbCpvoDwgBos
	QQ0HR0TnWfWyRPT28q7hOozcVU6e5BMTG+rSk3cyu4GRyYAYdVYnooV5lZ5zdTZGm5Rd0/AN1UH
	4ZS8n/BeMF8MLlAj/v3Eb1THs4lTG5S3FUPLRy1eRQg+7gZelpN5kjcfFyJ/7UQSSDYdzZqf+ei
	yHq+xqeKehBnEPcMVx/wASHCTvzWQynQ4pRXjyiOX3UosOOco37W/ddsgSWrYi3Y0A9W5IBMjfc
	M5M2H/geTdIOfDxpkPSvRjegZouw+p02zFhVzMSigbJN+5ZHF0rSWB8KMuiQXrA2IyJHRkE6+57
	k5LvD+hInnW2bc67BzLLDnyhWRZYcNX/kbUJvzDPTDoUD7qHe05i/E3E4t3hknOEtNBY3Q==
X-Received: by 2002:a05:6a21:1bc1:b0:3e1:8a96:7bbb with SMTP id adf61e73a8af0-3e928a24501mr11343003637.51.1793695607116;
        Tue, 03 Nov 2026 00:46:47 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364a8910sm901853a12.23.2026.11.03.00.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:46:46 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2 1/2] dmaengine: loongson1: reject zero-length sg requests in prep_slave_sg
Date: Tue,  3 Nov 2026 16:46:37 +0800
Message-Id: <20261103084638.1190232-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Haoran <haoranwangsec@gmail.com>

dmaengine_prep_slave_sg() forwards an sg_len of 0 to the driver
unmodified. ls1x_dma_prep_slave_sg() does not reject it, and
ls1x_dma_prep_lli() then builds no LLIs (the for_each_sg() loop body
never executes) yet still returns success, producing a descriptor with
an empty lli_list that is queued as a valid transfer.

Reject sg_len == 0 requests early; a zero-length transfer is meaningless
anyway.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261026115113.3359939-1-lixicaicai@gmail.com
v2: split the two independent fixes into separate patches as requested
by Frank Li; no code change.

 drivers/dma/loongson/loongson1-apb-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd2..e7eb40584 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -302,6 +302,9 @@ ls1x_dma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	dev_dbg(chan2dev(dchan), "sg_len=%u flags=0x%lx dir=%s\n",
 		sg_len, flags, dmaengine_get_direction_text(dir));
 
+	if (!sg_len)
+		return NULL;
+
 	desc = ls1x_dma_alloc_desc();
 	if (!desc)
 		return NULL;
-- 
2.30.2
