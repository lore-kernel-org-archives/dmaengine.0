Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4B12AD0C
	for <dmaengine@vger.kernel.org>; Sun, 18 Oct 2026 17:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792346186; cv=none; b=BuIFpglUAwnugn8KItBpQVxXZku6S573nimSe6OQeK5woGEO91s15BAqocxKbp33uirQ6S66V9CJxcrVCpqIgd8bMYiP5wIVCPkrspWpjSjTiA06zLRqLdKXlOrfkGYeae/XaEBeqJrpUZy+iMjyzJmYjzQ6wwY0qmrwcHXnv+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792346186; c=relaxed/simple;
	bh=C4zvxQ3ByJGufk7XoL4+jX2SllFBBV52SY2visrIqkY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G04iSiKTBd7TfP7xYWDa+uWpHK5ITlTwSHtXhpAr3/cGvx2Rg0YFA4bw5vFVtTsUpxkLj2og2Egskw41uDxEGckS4PhbRdIeO9SwyvAhNUSB225IlziqsACTnK9SUtpOm4k8JGf17iUjPlFglaEuJ5C861Es8CnFfFJJiX9I32c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIPbEQYH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIPbEQYH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so2818945e9.3
        for <dmaengine@vger.kernel.org>; Sun, 18 Oct 2026 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792346183; x=1792950983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOllkDlXTVHDfSWD1mHeu4GOOrDPlAc+Nz12Oh59KqY=;
        b=iIPbEQYH6lfHraOfWFXgHMfAKqjqIzcddjsZeV1hDbdPFD0uHoEE+1hmVkzeWEk47V
         hMYiHo0tux+vSn1P9t6/x8nGq1z1jplR4TmzBMTvRgsupUsrSpK6XzOkE1VIBK1PRZar
         ZUiEF1bDZMmMY3rVl0fNqNlY6ItcojSzbNBkurmSg4/49FVBHCB2E/oUMw5+dWhdHVIa
         u+tqDyh0lHncm28KJ3ia66sv4mGEPT4gLVKM4cZG+NKtrw/ciajA0dOFjSJPpdGXcXxR
         +ere9rnDAe9lXe7v7XvD2hY76wQ8q+n46Y9V7X+TghStTX2klu8jito4tZvPCUHSNG0Z
         1KHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792346183; x=1792950983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOllkDlXTVHDfSWD1mHeu4GOOrDPlAc+Nz12Oh59KqY=;
        b=O6rOW2dLGdHuIyi7cafQbqSAfhYQqsVIEeBvdS0SfXUd7MEFOwQz+MdUhDHbMYqqY7
         DqYdGbp6+PH+sF+1sJPF1M7DmODzqH5wMgtceVidK5GOlXqowAtqylB9ms2JVnz+l6ZA
         m7NsBBxu5deBggQ5f5NswQa28cto0K8rqDqLJlsjYQvVXiHIsD5qx16xUe4lT6HrcXcP
         pN0xoqhionTpOgTKW7LxEPArH5EJhirtXgQhXxZP+hTzdnY9dzAshWo4MV5nnvoHnmZf
         eKohoxRsvMCE6BZZR4xVipIwToq3W5KIh7Xzq2OxK0lw58vz0fHGtW2RonKFBJ8fwZ4C
         XNhg==
X-Forwarded-Encrypted: i=1; AKwUvBwp15Lq6TfoYncsZBFNTW7Nws/QOVnuLaSSv9MhXhV03hvdNKolnqTb9AIS8R33on1Gmtu/rbB5mB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCgCWH7n7tRgsznAZAJ7t+f8n0FgmGGP26EH3q7uykMFh0UsLy
	Pbpf6cUPUcqX/uGtHYr615voWJ+PUpvgtTZRmSl9Cl1wVeP7DRGnfgRg
X-Gm-Gg: AYBFou0ReMSJq9YvSoS2b3YRgdiYR4rZPgHkq/tO9P4MobYd/KmRTNXSeadR7t2f39M
	gJu40Eq+4+F1++m/E9/Qjibr22i53cz7lYUxTrBetF5pdpiWFo4D2/Vdnbdp4JXFUrKxwqRJAiB
	O2g/FV32C57hk4/A+HHMRZkmG96ksZ8bSIDj5Thndr8MtHRtDD4xjdZ1dUavB+1bHawCi6F25J/
	oM4y9LU9cKCAzRDo1B/FmFA9Yc4moEXsxNITB6SO7dCxwuca1K/1Q++4NigfgxTJp16xjKwi3pc
	xCYRevnXuujrDRhbIuGLPalWiPuHAp1Jm7+RzRkzcxqXUVt7aCT77NhXYNgDmg0CraMcj1+V6Ml
	n24wmuoV6l0vqoOCGhp99jWov6Op93mCW1tsbNymKUFxDopKbOrAvhx8Yi2TBmSnONPK+QaC57N
	DIOYYxIZ45xEztxirUnxXfQjgziB87U/hO9c1n4po1IPGsI25gR2RgrNlmWcWune1CkMO8YHgAn
	QuE+jAs1qnRGqaSzmp7FcoLN0DjwyqbtFVlKFFnHFJCfpTfU1VU9MJNwlKIeSceVwUiPCe71gUm
	c3vkJ1YmNX5rVdiKzd7JTr2nwM5t5EZCBJmrDlwr/6KwYUzpBxKhT6Z5+JeU35G5VchRe80LxGF
	EVgsv
X-Received: by 2002:a05:600c:5492:b0:4a1:e4c4:f6a9 with SMTP id 5b1f17b1804b1-4a1e4c4f8a8mr32200995e9.23.1792346183097;
        Sun, 18 Oct 2026 10:56:23 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-b13f-0501-c85b-b4b7-2475-2549.310.pool.telefonica.de. [2a02:3100:b13f:501:c85b:b4b7:2475:2549])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d756ce69sm140854855e9.4.2026.10.18.10.56.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 10:56:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: dmatest: make wait parameter reads interruptible
Date: Sun, 18 Oct 2026 19:56:06 +0200
Message-Id: <20261018175606.38045-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading the wait parameter during a finite test uses wait_event(). The
reader remains in uninterruptible sleep until all test threads finish.
Long runs trigger the hung-task detector, and signals cannot stop the
reader:

  INFO: task cat:71690 blocked for more than 120 seconds.
  Call trace:
   dmatest_wait_get+0x17c/0x1d8 [dmatest]
   param_attr_show+0x6c/0xb0

Use wait_event_interruptible() and propagate the signal error so Ctrl-C
and timeout can abort the sysfs read. The test threads continue
independently.

On a Raspberry Pi 500+ RP1 DMA channel, a script configured dmatest with
1 MiB buffers and two threads of 2,000 iterations each. The unpatched
run completed all 4,000 tests without failures in 267 seconds, but
emitted hung-task reports at 120 and 241 seconds.

With the patch, the same 4,000 tests completed without failures in 269
seconds and emitted no hung-task report. In a separate patched run,
SIGTERM terminated the reader. Both test threads continued and completed
all 200 tests without failures.

Fixes: 2d88ce76eb98 ("dmatest: add a 'wait' parameter")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/dma/dmatest.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 2ae346939..7e6b6c446 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -287,9 +287,14 @@ static int dmatest_wait_get(char *val, const struct kernel_param *kp)
 {
 	struct dmatest_info *info = &test_info;
 	struct dmatest_params *params = &info->params;
+	int ret;
 
-	if (params->iterations)
-		wait_event(thread_wait, !is_threaded_test_run(info));
+	if (params->iterations) {
+		ret = wait_event_interruptible(thread_wait,
+					       !is_threaded_test_run(info));
+		if (ret)
+			return ret;
+	}
 	wait = true;
 	return param_get_bool(val, kp);
 }
-- 
2.39.5 (Apple Git-154)

