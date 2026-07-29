Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40CC4C9542
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335577; cv=none; b=aqWFI4nWzI7Wh0UsqutUxXCUim6qFozgTN/UigGzd2c0g5cTWeZXBvHhEtvFnHB6Lo+LAFir/12LgO1aVdtsBaGyDSKKUs7USozlaQzsS806WerjbdqqIs6v0lZksFTH6QMXgliBDuBLIUMVKHFWsADirzQXX/7eyw16qOtTvnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335577; c=relaxed/simple;
	bh=qUgMsfny6t/6MT3olsoCnkdJ+SeeKd1sE558ylYR/4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmZNrSLCOXje2CZsvvFO/Xf4L/VI8c7lIS7MByOSjsfDn221ZWKO05lEg7Ik8Us4Nf3ALf5KQ0wNlUYUYERUHvyfqdpldECXHAAIUiPpaX+owXR3nzVS4pm5eqNUJQuxOo+HXMHcPokfsspPQgZFzU8nGrebXNrQzubrUgO8EoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mD131jw+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mD131jw+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495437bb891so8607315e9.1
        for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 07:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785335574; x=1785940374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGuaVvKY0Z6gylP7ain3T9tRdY9HFEH1joKsIPA7gMg=;
        b=mD131jw++6JTF2VPKZ1qWNdxRMLjhmnC/M7BathFxrA80lKYCTih4kho3gLlCGA1J8
         ck/jk4X6x8F4oHme1ZkdNsPt4MxpurKF9EsMe+gQd9Y+CexxijBUGa7X5a235ybbS0nK
         qH/CtKpKKtSQcE6gAMm/D2HWUvv6plVyWD8ciavKKF954vE3jCG7+nQmgdI6z4nGb0IC
         cDl1DucpugIJVDGsceLsfjokwugDLLfp8PUsYrePAlvjZ/PXW//tT7+Wu5yKXYtsnB6u
         QmiPNlKpvgNtMd/najmWKVpblA1f0XCUjRBGVZ9NrbXYEZytID8rTM1E/+KnLPA4rnQY
         u/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785335574; x=1785940374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LGuaVvKY0Z6gylP7ain3T9tRdY9HFEH1joKsIPA7gMg=;
        b=HgzJFdgpG4us15+YnsZpEjsBGSU8fa4p4+JCeWc890nIruvu+TD9eMSimJJvMNTMse
         5h6FwVUSWvBDf7L6WDwViIxOS3j/ibJ5Yfuecu62jw6IRE++jY5YACO8JeoVVGAcGCQm
         hMNopshg+JGMbxGyyVx6pEqNEtuORioIeVdpFe8d1NjZ0APT78rxDTsnLU/YvHkZkInD
         IbLpkwk50W9/J5fQDjCUusXZWL7aQeweeyhtDkfgX8eSqeKpmsKFz4+zYUuLFh8fZN+d
         iZ8uSsaDTz7mEpBtlK1sncTE3aX71dERbEaH6nprzWyniCDkSazn55yDLSL/CeG3vbHM
         GijQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwXAdfcrmf1S6YuoM8GiKLIRHFvdpD44qHYjzYzN93UxVanwzncdbDOISjI4tp1zCdffEjlfZ7yKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM+o8fX0L9jJfkdZrfW+rS4tOhzlsBKRd4Yx8VfXOaV3Fam2og
	QZ+8OiEJAxbACxhwrvoxFPguYm82A8kLcFZBXoGFvy34YTyFbsa8rhTl
X-Gm-Gg: AR+sD13gni3+4Ai3u2lFK9ZUVlIQC2b18oO69ArhBK8PuWNW2RCOSP/+qTXXVk/FZDZ
	YdL/G4DVMRulB8tkadVJXRAvtt6DYAmgLg2u0qniluxqxngEsSD9C3A6N/8cuhqWx5YnSYb8HxK
	5KXpCmtdr3jtlHczKFCUZ8hegDuTWiAJMNCDN3qO+uqSOjvEG07g8qwOFSjnHQ7k8xvu8s7VySU
	4x3BE/6R/q3YRWO9Pdc1SRfMgkX5evUIvzDiUzjC7g1b++VMuGtp8kB3pEyXotywYNwpFe/A7pf
	Zypd4Yk0BMGyDAmz6qRHtZEcUt75RTZlg/NlpjLKpdnHipIcJh1cIMeSA2+gWoPoEzQUJm+UY65
	1+7sZy8Ac37Qow9eFesDN0Lmb0ObaTw5te3KjuT83dnA1DV1IBmEWpk6Yn7z2ox5wmVDNRugW09
	EeQI1CXohnURaTV0lCpnn2CMNQsk8n3AbXa4mcSO3pq0e5XOuexNDofmNrZUw6hh5MoSIJWFsJy
	CSTnkKjypo=
X-Received: by 2002:a05:600c:1e0a:b0:495:6193:c6c0 with SMTP id 5b1f17b1804b1-497fd31a32dmr28536595e9.18.1785335573401;
        Wed, 29 Jul 2026 07:32:53 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496fa43b28csm40692265e9.1.2026.07.29.07.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:32:52 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator variable after list_for_each_entry()
Date: Wed, 29 Jul 2026 14:32:47 +0000
Message-ID: <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ls1x_dma_tx_status() locates the descriptor actively being processed by
walking the LLI list and comparing the hardware reported next descriptor
pointer against each element's next-descriptor pointer.

A list_for_each_entry macro is used in the comparison phase. Which at
the end of the loop leaves the lli pointer at the currently executing LLI.
However this also subsequently runs for a non-match lli, in which it
points at the head. This causes a type confusion bug which treats the
head, which is a ls1x_dma_desc, as a ls1x_dma_lli object. Additionally it
goes forwards and prints garbage via the dev_dbg.

Fix the type confusion bug by only allowing matched LLI descriptor chains
to print the current LLI and residue calculation, as failing to match
should be treated as an unexpected condition.

Found by the following Coccinelle check:

  scripts/coccinelle/iterators/use_after_iter.cocci

  drivers/dma/loongson/loongson1-apb-dma.c:461:6-9: ERROR: invalid
  reference to the index variable of the iterator on line 450

I did not see a bug upstream detailing this error, nor do I have the
hardware to confirm this bug or error, all this is from a pure code
examination.

As I do not possess the hardware, I cannot test the patch. Compile tested
only with mips64-linux-gnu-gcc.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---

v2:
- encapsulate residue calculation and dev_dbg inside the
  list_for_each_entry() macro. Treat non-matching LLI as an unexpected
  case.


 drivers/dma/loongson/loongson1-apb-dma.c | 27 ++++++++++++++----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd20ab..8658d5377795 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -446,22 +446,27 @@ static enum dma_status ls1x_dma_tx_status(struct dma_chan *dchan,
 
 			/* locate the current lli */
 			next_phys = chan->curr_lli->hw[LS1X_DMADESC_NEXT];
-			list_for_each_entry(lli, &desc->lli_list, node)
-				if (lli->hw[LS1X_DMADESC_NEXT] == next_phys)
-					break;
+			list_for_each_entry(lli, &desc->lli_list, node) {
+				if (lli->hw[LS1X_DMADESC_NEXT] != next_phys)
+					continue;
 
-			dev_dbg(chan2dev(dchan), "current lli_phys=%pad",
-				&lli->phys);
+				dev_dbg(chan2dev(dchan), "current lli_phys=%pad\n",
+					&lli->phys);
 
-			/* count the residues */
-			list_for_each_entry_from(lli, &desc->lli_list, node)
-				bytes += lli->hw[LS1X_DMADESC_LENGTH] *
-					 chan->bus_width;
+				/* count the residues */
+				list_for_each_entry_from(lli, &desc->lli_list, node)
+					bytes += lli->hw[LS1X_DMADESC_LENGTH] *
+						 chan->bus_width;
+
+				dma_set_residue(state, bytes);
+				return status;
+			}
+
+			dev_warn(chan2dev(dchan),
+				 "unable to locate current lli.\n");
 		}
 	}
 
-	dma_set_residue(state, bytes);
-
 	return status;
 }
 
-- 
2.54.0

