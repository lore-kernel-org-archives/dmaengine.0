Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8B23016FB;
	Tue, 25 Aug 2026 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644607; cv=none; b=E2CK/h5gI89CrnIFUICv25EVXyFB3Mc+cjpRxarSycnuV/HFKvUGeh3dHz3fNjIsxIO22ureI8L3I5xEF1ZAgG6AwzSU3O/UrFieewMNRkmugvnodsft3pmQGzhnkde9gOmHLpbr3ZpWHpGYPAHRSfMcrJM2xOs1Ntji9lY1sZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644607; c=relaxed/simple;
	bh=6lK1jAthmvNfKpxkkGalDbp6FwxklR+Ej33YeJTUSh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKjnlyRzJgsFhmC+f7upZUhGcJ46eD1biLZLUPyXd5JqCv/M/6Q2HkUPEMYLkbiC8o1dWWVauezPAlgeveUZUMEgd804g9Qcg3XiiBp+e/P/XVWvWU33mi1eeBkW59OcUAi+2t0FKT6eCQaU3GtG9i7bXlcokKwEIx11vnTjbEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=k2lNj4/O; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="k2lNj4/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787644597; x=1788249397; i=markus.elfring@web.de;
	bh=6lK1jAthmvNfKpxkkGalDbp6FwxklR+Ej33YeJTUSh8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=k2lNj4/OE6uMbCEG0kPGMH5tLIBDEdXcK2maL4c4U5Qam8BRFLxcBKOx/z2APXZr
	 kXLcPZTY05fqPd1MfOg+ttE2sYBV9mr37TC6usRt9az+u7ESNZc493K7JmsjBh1M8
	 sQgrokAotOTv4mJlnZXTtOts8YcvfJttsjMRULRgrf/+QH0lAPHuHkG3+ar4+7JMk
	 tlM4kTeI2I7GPKmgtf/3bXhRIbGlgmaXex/mP+//vQRU5QWVSDUuFuCWHykVj0tVQ
	 hFqB6bJhWqxjI3xCRtRtneXwhA89GFI00Y7PYGTKDiKZ88VETtHlD3hWdJeAN6kMR
	 bIXRK6231Hwa39APAg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MUU6E-1xP8aq3gO0-00O5TR; Tue, 25
 Aug 2026 09:56:37 +0200
Message-ID: <abb67a8f-6bbc-4855-8928-be42ba9a9538@web.de>
Date: Tue, 25 Aug 2026 09:56:35 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dmaengine: bestcomm: ioremap early
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Frank Li <Frank.Li@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20260823044900.11466-1-rosenp@gmail.com>
 <8735371d-b466-4262-818b-f854c83e23af@web.de>
 <CAKxU2N_f+spFKbvvPDkh1VLLqrmSzBCZ9kvbsFDc2SRibRTGnA@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAKxU2N_f+spFKbvvPDkh1VLLqrmSzBCZ9kvbsFDc2SRibRTGnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HGxB14I4eocJCyc9LjdsXayWQeGcBRBtXGhlRIKJrP5uGyby7r6
 PeZV1ULS79FP6MkuS7G8e8dE8RbjdIJ5+Xtyd417V7lIiTkOHqCaqHVpO4iphHnowV2Oh3R
 gjSp6JkwNy/H3WU+nesuetUPJTEJvS/WnLE+msUL0s+PKLZrn5za6GsrKv7C64CycXgzwzm
 d11uQO7BwI5KQlY7eOIMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BZ3b8MclRVQ=;io/0QmmB3C4n24ShMEnk1/uz9+o
 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

>> I would prefer a clearer separation between manual descriptions
>> and tool-generated data.
>> Can quoting styles be improved accordingly?
> what do you have in mind?
Some possibilities are known already for this purpose.
https://en.wikipedia.org/wiki/Quotation
https://en.wikipedia.org/wiki/Nested_quotation

Will markings be added to selected text parts?

Regards,
Markus
