Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03A343D501
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786702451; cv=none; b=QI7//BSnYKY3HI0ROg5p+BfvwRS+p9D+Ote8AeZ6t1uTIkQnG/mSEdRnadr0pBNm1S42WYnzFBi7X405IBAF9k26rnb9CmaHo4sI0rTqjWzU0NmN0CkzcmCtsy0QSkVI6lLTGbEX2sgFCTXdWwov7I2uIByoR3p9NUagODgcqbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786702451; c=relaxed/simple;
	bh=Fean+RnrRmH5yBHcXW6hh9Wfxwzlvz5Lyo2kbq1z8Pk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=j/g66KWDRov22j05a+/v/+XfLWyDMGqjeKQp5NTGxwPEomHaTm0f6rtcGUQNgATuCP1bEJ5lXDKanbOrDvhS5ppm1XuIXhKPrqwL/SZlFveAjKI6dRftlJ3Gws4Gb1xsiNquC8whCq36yZ0Z+k5nTnFFLby/yc9AzjSFFUEzHIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzsO4PZ9; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzsO4PZ9"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca7c1176317so664615a12.1
        for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786702434; x=1787307234; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fean+RnrRmH5yBHcXW6hh9Wfxwzlvz5Lyo2kbq1z8Pk=;
        b=LzsO4PZ9INKWExex6wd3ef9Moi0+SnTR1g7MDtngRZQ/qRqRkZx+mp16+GmaC75GVO
         g2bnk8irZt4r96hB9kXwElFuBrZLY5HRSCwykenqd8uZJ2ofLXnk3yqpsbxF8K4yes70
         esEjikTsXK8PqKjqpWoGl+LYQhAGbOpLBcB35ijfq22F12cUnoR+9vpsIYWu/0bAvCo7
         7pVAUPZO4N1ZuqttejWpqCK7wx4FQijHQuxYBXX1y4ZbLT8TSWzVeVtpVk3gqKmQe3tm
         IFliOqiDcSNzOT6gu82/BHad5PoQrDCAaq19dgB+5C5q34FXwxlCHI+5UzXoRAvOm7ES
         hj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786702434; x=1787307234;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fean+RnrRmH5yBHcXW6hh9Wfxwzlvz5Lyo2kbq1z8Pk=;
        b=BtGEgLMen+qSzngKAFuROlYnuDIrazOrkw7SJKrXBkW0BY24OPSIASnwj5rAxjg4co
         UCs2oIwqeuXv8Ri2ahL+f4JdyzNpW1x2r+timp1rhx6ofFQFJEFpqOK+psPRaCXsrARn
         fjy525llRvygeqfcAkrKDZF0i9ecoyHkniN2Hgdt52ul3+ax8V+0VxwYpyOe9dcZ1Lll
         s2dQa0511xhPOUXRX4KFGjPUjZ+0WShOm3zzZ1KpEPKlAsORN6TberMDf6Js0kjnQFHj
         zUJRaHAZhX/LJB0T+El/aj2t4jiH3qTpF4f72jd2XRju89OxQcjVxh12GkZmf/1QK7iC
         eSow==
X-Forwarded-Encrypted: i=1; AHgh+RpBZGHefoMgrSwp33ZuV9Qif3fhsTHqneG1n1eFa/2zzALiso0fCRqjMYCnalVABE2C0funk21lSxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9tgWMxx5vP+aCK2k4RXLxNH2Ag6NGUSN+xltM6SMJcYSjwRt
	O+mp62Q7lYBHOFhNPNVJWsZ6DRJMU13y2mG8HoqYJxfZWA00Gtbu8zus
X-Gm-Gg: AR+sD11Wumxx0o/IFczB8wk5MDhBx/8zJNIJkXOkKgjsJuwPNBwyob3YrIDGXwVGL9y
	BY3ptdEdLm7Q3DSMJE3cGqtIhacI3DISYhsVw5Ge7+CawDmi/91Z8mGlJC6OzH+GhlBFhMXSLmS
	vRD0MnFv6zJzyN9/r0sgmare7JvoIKATU92OTUm6EzjIUaPmL9h/YCVpY/ve01e09Nq0DygeRit
	DaEHJ5WmksVCxhBqT51L7Lh6R291drnOPz972tjvY0khXkVLLcLp6FBomoyZA78j9au6pqFzdgU
	NKz+za80KVMPlFH0AMcP7PP1w5XHWk+qP96rR6MRWb6Ek4DqSAxhdDIcME3pb++u3SkbD8ZfbSy
	6H/II9C4R1cMRzClhNnU9r7eRxLbHrhxcy1Lcx6OCof68V2YIIE35at4pu1hR8p/7DYdSkN0pNt
	knlZUei7qDwHq26/1Y9RPFqo7J7WL49qsQ0DFU3nkDGGpTFubqZ9x9ajH4/qatKimKt94Z2Q==
X-Received: by 2002:a05:6a20:12c8:b0:3c1:85d:fa2f with SMTP id adf61e73a8af0-3cc71eb2723mr4675562637.36.1786702434016;
        Fri, 14 Aug 2026 03:13:54 -0700 (PDT)
Received: from localhost ([2400:adc1:447:6d00:6351:4475:eeb9:18f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387e49d3sm8058237c88.7.2026.08.14.03.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 03:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 15:13:41 +0500
Message-Id: <DKOL5D2FVB6K.NBYEX23T8EPG@gmail.com>
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
From: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
To: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>, "Keguang Zhang"
 <keguang.zhang@gmail.com>, "Vinod Koul" <vkoul@kernel.org>
Cc: "Frank Li" <Frank.Li@kernel.org>, <linux-mips@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
 <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>

Gentle ping.

v2 has been Reviwed-by and Tested-by Keguang Zhang.
The patch has no outstanding review comments.

Thank you,
Mahad Ibrahim
