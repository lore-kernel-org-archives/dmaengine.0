Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792911957;
	b=sZiZw6uLhjfComzpoBS6oyfHiYLKzsW8ktLWjTHixL2mHn1CxR53NRFd3gyBlX9D3L7N
	 eCwKphuNUB+qGNTXRszjC52FlAFv7p0vDUYk4tB/j+rUGtoYX1KB70EHCpbDlRBwoWrV8
	 prSnefDlOoT44ZeaOsSgKdlrbCfHfrd6s1ZSgIT1852GO83hNOIexviIu7NaRglsjFKnU
	 a5NDQNe9Iavw4m5GE+jCULat00D2slikeBMjVluiyuirOZil8Bx2RynRIAiutxB2qOtBO
	 2wbYvWPHwbS3EYfd4jJ3dHXKWCXor6j99haKQF6P9jij7TWQm0/GPhreVA71QeSoZDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792911957;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=ZHgf9Oqz4kON6PIRMceQHOAtbrDTsic99xdcjhJ2H64=;
	b=qrBLFwICYuNYMVycYX02wUNfxNPRTuyEJkc/ZWAMbSzXshug3SqBpxip7s5+HAHW8or7
	 38rd9UmGIC7gpe0KOkBtv5zoC45z7QA38tu1RmrXiT86FlK3Ur3yDY9iv4rH0KUBEioCA
	 dBh1Fx8E0oWzEED0m7J/wOWTOXLDG6yOGFPlnYkdnPbv3lXsZnzOyLjZl7cZLm6RQDxBs
	 qIQArJC2XuxV7ipVViOBYIPYb9aeqR4isydyDu1VQ0oFnd5vt3SyjeoITrRNZ9yGoO5Uy
	 InQiUWoofvxQc5b1SrrRndl1H2jWtAXHuKjUdILrsIP79JJT0NQ8FGb6hKL4dcJ2Hvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b="L74DT/QZ";
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E91606A31A;
	Sun, 25 Oct 2026 07:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=L74DT/QZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1792911948; x=1793516748; i=markus.elfring@web.de;
	bh=ZHgf9Oqz4kON6PIRMceQHOAtbrDTsic99xdcjhJ2H64=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=L74DT/QZ5OrxkqjZphSLivWVoYV3OMfwcsBKutCrePr94HvT8gz2BcL7yVaEFzCg
	 X9VKCpnpYFdpGL43/ETmw8hURDslMpAZ9MIFR40YcOYiiogC61MtSJkTAZhkmVvkL
	 A/iVYqlh+WCznTl6GG8zhfKHntNbcbLsBCdMcdVHRO2u+cB6upvwU89cOVovXZ9Xk
	 0CsB8rO4rWUhRzXFkiYlaNVLXE7O5FGem8o6x/CCMBm/14rdkh7ussiJLORo6mz0t
	 YxoiDnnlI+g5+oWxv0dk9tUMHPKGZGWdEN0KaU9Q2QboGYSY1nRWV3H7BoNDEq3VU
	 2LT3cuLrD/x+ynI9Mg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mt8kN-1wRWkv0TUH-00tU96; Sun, 25
 Oct 2026 08:05:48 +0100
Message-ID: <ad468ad8-c7d2-4737-ac43-827fe02aec04@web.de>
Date: Sun, 25 Oct 2026 08:05:26 +0100
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, dmaengine@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Frank Li <Frank.Li@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
References: <20261023-fix-a9-dma-wq-v1-1-b414de837e6e@amlogic.com>
Subject: Re: [PATCH] dmaengine: amlogic: fix workqueque not free when probe
 failed
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261023-fix-a9-dma-wq-v1-1-b414de837e6e@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3rws5CI/7MTBtlb3WWWM7Mr/AAe2xTFSlBPb/BKb9JvCUh/l1nC
 xuANG5mzetSBpvtI8Rkk94q3zpGG8LLE39yjbv/1cHqMSarUgk6Yq0A0tB5L71r4S3JPhmB
 h+DCu+xqV2cTGOqHp1tdbLX7k1R21RBAhu1gQOoGlljmVj+noCUb2LzUDZO9nw/AmLvV5Qs
 GLy6iBH8xS/4QxnthRUGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cTkS9iLFIfM=;zX3Zcqlmq55WnSqqryhUzqE5rZt
 YFrvTs9w9fVchHTvXKcCnS75Yg2iiG7XoUKNaIOJ4isoRg+Knh0oiO/MTA3KQwHBdwFlyk/52
 7jgYzChI1MhfayFW1BqQy/pLwJvhZcg6CjrtHQOtk2I41VGcw6MSzTgEnMcVdWmv4S25Z4ckz
 8zOGx8edSzxgG7oCuY6X4g8cJmO+owV7ZQVQD6pO67SuK9xYcTeRkjeHhSTdDesLwf5yDejOh
 kTloh3TUnvS3ECPxgESAv/ge8Sz/8XnZzFFY/yumqH++t0P3VHM9EIwIWqjeC5nURv55gGrPF
 NDI/dTpM1H9IRLZldwF9WVaQpt5ZymGIIKfr8GUu42UTSB2hRp+Gc3YgGixIAevV30z4EaEbO
 udAV6WMLgxtZh7QtQ2eio9l8nGbylKVsROskW1/AvxNUJSIC0n+uB+emoHO7JcVk4WkLHGGTV
 SWOW2T/5nLJB8TNCJ9ROH1+5BR6tiJXuCgMBtvKxnRbaEc2HU7i1KFR55C75L6KY+DD4CtFQS
 P86nFlTinMVJqFHKTu9YMwfAi8vtqvqhTZaTkbwp5RsOjzbYHctO1qHwrmA+yzHDMaUFF7SMR
 ptfZm/ggCs6G4d0U2SmTYNNG8YHKfGUT3Zn31c+agb8MWcmCfABDRbXXkz1ZWUZHbuoiAZZD8
 Y9WkS7W2qRf1yCw68/Tw974uNtEkqSTM11s2dqp+i9PYhp/+1F5s3TAPeoOVvczWDVxnO+zLX
 t+WXSDYoR8fdb4xNu+5nFnqXnGjmjs3XskLqwzk/wwkUQ0DMuszE3VBUMKfNhNLKnvhygDdBf
 hDt4BVXPoMo6zP6pB2m8npZfsLG52iJ1UXMh4WcDXAOrSUss2Zj79J3pk/w8/eFgseM57yKhu
 k9NgwU+r7uPYl5RSNT9gHxF5RoST331ybFQnwikAFEUHSQwkh7J2QgC9ar/oaWGT/yhJj5E22
 Z5ws50VZ+c8cm1jK3El71GLUcs1zsvLcHunevsEPlDNVR2N/10AvvOPG2CA/aKPAq1qZNL7on
 qGjNGKMrdE0sqH0W8JHbtnYzhhvi64pWwm+Q/vsOz0a6ClHJ0gB0q+akj/ttjBp9JCrtPl+sG
 1uaZyHEKwkXWs6SDIBR8G3RoPkpHGqo4gYAqszt7V1/IdsbwkTttfqKg03CVFUxybNhsRRZ3j
 nMOrrn/FoX2fbQYyDfHZpMoT59L3R6qmb6V0GefgSrfMCCYv4iF4yhHWP9chZktnE+BUVxGrm
 /Abj2mdHxHP5ZQqOJr3Gi6QDwgd0t5bncEGs3waeqRt0uSh0R+MLkHKTmggpYhpufCup83f8f
 sCxKY7xeScpMZ9q17UaehZtTki6i+6ZLxK5Glmm27owiBmoPlpsNiqDRtNC0bVLdjN6esHsrC
 rS3wLTk/YjJ1Uuhy6qmANkjaSkgfHUTXFIt7RC8h4dmT80H1T1Jx8TzbfB4uoVc4DmF3CUAqq
 LUKq7Xps+Z//NgTY2wJrmUoWgPvJvO5B8jfwKGzlzXhGVDhemwZu4kFevtNagf0qWw+PF473k
 u9dhMl2vizHkvZkiz+B3rssQRz1PR2j8bDCKG5GUR4HgMEdkM3/OJxN6Z6sAL4hqugcmnHfyV
 FEznT+Js+VL/1OxM32ozJpwfyN6HDq6SyJjopZp98KiLoAMWZI9sQ563ZRdY8JvhRmcRqORQA
 SQFhr3RR/9Wu04PCfJI/SPM5Sy8Uwm1EFAqp29jmMZLzbCnzyC25HFf6Mtc9nVIIXW8azEFxA
 bdAaQ7SmR7Q+QNR+IgQWfBzCz7ejMOl4xCYy1pqxPbBDZ1rQK3o8yWdWrwsA1zNZPLSQvnxIj
 uNc23C8jukNq0tjV3ul/Y5B5STpjB5eVct+OFC4IT107D1j1kC90W3REgSjBfgM5GfVIKYGM7
 5LfkOrQbeVT9yAjRatNT2UpnpGqx4eutJ1XPgPkAySvlVNXvDhXH/+2sy/jhtIgrDpI1a/VzM
 MqcRbJL9SxuPQcaHwNGa6pY1zW/85MICNBVIgY8NNRJlt+dS+3oSL92TTliKGQyMQ6SWiFjMq
 29jRYCnmvoiuROefRUMRavad1xOEG2wra2U5ZxLorsEAl/nAlH7I0bjpMwyLHGivOKr9cl/wm
 DaC/d3xnBsAiQtmY12qgN3lauNvA1BUpQaq7dMVAiaVZqUF2eFAFbHFDyZRcT5K/peO2ymbPZ
 zrYKlRXmc4EavfXzQtWuiq5JZv71/R7BIauXTK2fjNHELooHDOYnZ/aVTF3qOChG6YEcJC9Yj
 TXgG3cMATf/pwnCwP9lZI3DYMOOf53BDJ1E5M53uQ/qfTIYuxFcO9GsRMSMs5i9lXWbcx7z9R
 JjtB6SA8vQVTECEbC6AkP7QXwh2KuTUkqH1TAkpF/REWaAkEPYaEL0jMBwZzy1PCD8WHuXBCP
 qhDAOxsm+EHvmgAiu8bDpHdU3pjhmn7iNh+X5KmHBP8VPkDpI9PbhwjUq2Zi7m0Q5fBNngXg8
 c8ZHT3WQnVA8p91RAIStwVEbj1iYAUeqxfDSG3Mmp8lRhYNEO0G/U3P9+TeuBqg0DDNGj4XrP
 iEZtKi8QQ+58SpehOAEtZiDiShwQDp87z3kSD07eY7qQrbwYwguJGQufaDk0LP8OhRLFeTCmB
 KoLQFo95g95JoSygcce9WjqL+TAa0XFo9NYwzUd3b9m8I5h/Jnm1mfSUFlJEoWhQBIJYCTwXa
 FVyvSDdMop5CLXfsYSOcq6qIWHw/QvZl/L1/4EU9kkbWOK+HTzCc7hXcdmnJDVXY5hJOYKRQh
 YlVsReBxFwPfaLz8Ga8Dja10QWdy3IT/2bUq9ZRD1BoYhbctXxo/kn/wx0++fg9G/dOGhYinX
 OjpXwlEuJYaPVsxcHs6r7/7a/rSXnCSSQtbS42Fyk3K/6VWVJPRy3TlU4nIzPDsxRppFSv/kK
 zoGzqNOe/d1xHErnPdyy00ZMt4m9nOn4pqEJi0L/EJzhlgR98KPr6by04M22xqRGD72iFTaFp
 M40VzxRtWQwl69QweohocaoLIIxfvWnX82OT9SOMkmixFbJpSa2AJLk85X8OXWSmdw2gxWB0u
 vS3kJPc9i2XmLz53tEWSlIO/ruBFFUmUri3wTbEzk2dfFxEwLsr2vWPYSAXKmV2Jq6mrsmiTk
 3VQSol54yHJfQuF1LjTggTqLE9HgmPeS38/OXqQDTwyENAgCWW6t3Fax+0vrIjIe8tvbttoGZ
 ZsQDl3yx/4BB2gQ1kCATELspXBrA5YqNp8Fj/KwMbP3RSAJxsAjfAz0/nns3Hvw3WM4OxKhxV
 GlaEJU+74DJ/Bia3br2n+MxzT5HBXSBiZCIO17JjnND1yYb64rTOrx4wq26kjfhZRIXevs06p
 RzoNu+b/X1aiVQbL5McdKmkglv0Gaddvl5PEw/QCDG7gh8Q9e+9v8WJeCCZJlzhVNKbx3Uswq
 UsP3KH0bf4gdI/w3tVKcdXZF35DQ6+9moO1iUIO+c0Bu1Srb/cd7R4QqeMdcvbLBP3l8uN9lW
 CXorhcFZxBlEyJwl3iilYckZpBKp0ZudkoPOZHBUUbTk/q+/thjmg5u+v7foU+ThoE4A6QhuH
 gmDikrngaNoW5mdxYlHZpjcQBK+WVowN5Ocsor/67t559rhIRneqzIdRZ1gPueRQuXgQAkxXG
 5EVxQK5zK35s0PnexWop3MCVvlPG2HptVB7Tdq0t4+/R9QGE33rEtVfUqt/8DIUCpyNrklusr
 0FG/OHYUEdEjMOz1se1Yifnt23iFce8L7I7b6Ca3/pOsichQykp3xAyYQlN1nCC460W+IehfP
 s0nAiHG1CwxMEaYBfX9Gm++WSWcquzv8fJ5Ynpw9O0Aj0uv/igKwh5wpgPoMB88mwL/gnj7lY
 Bl3q5Lk/vmShvAuVJ1aRFIIUVnrm+8rP+XfHIHt4nQDCLp1Ee78Qolg6MdmKU+SD0iLNNKgGI
 bjQKoLe1buyVwITxGvWNP+BgqANVzFHsjpI3aeqBuIY6hDKheDnOQXQ16AC+Hodex0w4pSu25
 BAmGCu1Qb05DvwIxvGYMXDy8tCMo5jaAFZV95Om3Veg109krWr8h1MpdWm/2b5DNfEbMmbsqz
 x7jRHWalrvVX0HYeOek8CqNhbvdMRZrxUoN2Gf/trYRF2dORbsjqOf/BlqcFZpWx9028SdtYP
 nsoaxtrjWhjAKmdfQKptlKNbDfQ/OO5cLavfA7UVOr12pOM05T2NdlfiR2R8MfmBKVZEwdpz3
 6CUkcecVWhTlOOgI1AlLilXKG+uktY+HInNHQWT6SZrzG/K8TcGS27f6Dr5qozgR/wwSKhlso
 I/bueHYuxiSW8ghjiUCrEnuSu0MgxV6+AKJfyuLbSdTynWxqD3wJYtjqP+vRVCy9FVFnro0SM
 spyYewdFKEfQUSonL5pIxUf+BhyUqm8NkwP8UMZa1n5YSoZhu/JoG33dhjfXA4Og6Q+H/88d7
 qZ6DqFf80Us91TypSWBXk4e0aCt5xA8ivCW61COujJDI7ex27gcgJ0p8h0GEcUEekApmopJic
 L8TGDi+m5iPzthtJVUbYEOO0fnzHAKyJX5duaUzjzdP/8tu2QdZxlp9IbmKLBc3hTp6Kxz+Pl
 70a5n+M7vWa6G7on0RbQKtQTLb8ztDaQdhKLlZimSC7kpN6/bfh+bJmCHYQDGo8Dx0SwY0v80
 o/CuVdcnJvSIep0TNS6yLpB8OWzLdZhi86i8E+SnP92VPwqdCY1GMtaD1XjWNPQo/mkXEQnjU
 Eahsl43bcEMvcNGK4LSjgqyMMbRVqW3uevXUAzY/a8cnyWywyhcXhB46miiC5H1uSc2kboMX+
 129l1RA/5JP9ofA7GKa3ITP1EZ0XXbEQWJC+hr+9Q0dOcNvBiIZKXWAR+J6MShOtjGRUO9DhI
 4/5V2U7muWgKfd6abNRcOXOdn0nPZdf6NfcdohvLk0b5+WSTeTqPsGWDauCvCSVEq9oXXO61L
 3EzXtXc+A+opIbPzaoiJTiooovvuGiMBgwYH4XtOVa0D3GkdeHm7/NHlFBJcPQhFv1IPiajVP
 qzmj4FWfr0KfcG4KKTEXMRr/84HRDRyOfYKT1gZCaImKLihXCE/jLkAW+GblM4DCqPqPhMn6y
 fFcluGvr3QATCl/0TlU3WtCJfvsh47zXpY8hGsKwqXK9nI9NhGRNsiCBcynk9arsZ3TwJtYw+
 byPEKdAifFNZzGTPREL/yOA4QaXu7o1xotzQ6UgaSjO3NFGi0JpYfjJpuswj+3pDNQT8+N4n9
 A7BAOwGMbCUJVoaEVFQOAnh9fI0tBMlZStU4DCowkXn9+BISfCzP9HM/vQo+cmT1xjx/yYUFC
 YOcwyQDvwyaR8u3OxHx9HehNkVcn/KL6iJzcbnzbV/wVIe7s5G4dTv4dbYby2YOQYi/8NxmOi
 ieCX+hygu83azd5OHJR/L0RWvOJeenAIfYi8R7mhelhBnj9AQnDsy7bPgv1nUu60aWWJJpz1a
 ZDvjXoHKwPJHyxXmSIIRWqGJrrdOxzfDXecuKznIuFlD1Be+aeH44wABwmwPYiSi0nXDYvffG
 Bb/1OcSxeW7G+Synk7eVukumUYV0hK4VyXdcRpqUIANe5bXCmiLIHwizgZQAk/8xdzswLpB/E
 nsGgbb7S6gW5hGOs/03oHt/TOPQi/QCAyzsMqzOJrb4TN/7JIKh121tjd6HYo9pA926hfvse4
 X/BsamSh7VmIEKh2ztyb4X47i2yRY6pg2/1gDkZ7a++ik75QzAeWaRASyIWymWCTIAyEwNztR
 XSzK+bzusWbNkgCRONtMqq+YeeSD2mNaY8z738MGQl8ctcbzGkKgG8T5WIETKn4IYxYY3nNoH
 5VtnCgPeAC6IvKF8YGCWS3JLyFAnTxZEtG5i/ApYM8Wkvh/08RxLj4Bp3WTcPbUgH4VunZmY+
 E8UATcXHCAeRdmd+82XZl4uwbpoFHcMuRe//i0/FATz0gzV6LbihLEtBcXzQFnHUUPyGwFZkq
 DPaZ6oQ+M6coD2PhFYVo6YXOi6J6cLoY0/HdWb2MRXzenbO5UB+cuRo74N+euiA+NZA7KTTkp
 7XirWlKMaD5X2J68P7k0wgRx/ObmvEZPQI2O0GBFUHuwB84kWbXiTA31VTlMle50MSIG2da4z
 9kbK4tVOkH8qB7ZR0/3pOYdZ48uuCmjiyQW4KItA/9IEa4ir6z3p0gXBNsm6DZrdEJnuZKvvI
 TF5BiHM9KxpMxnWeOrtfNBJgKWRCBQq7ZPS20dhIJGD1f4eGgXmk4bcJQYVMs4VmppXlVo8I0
 Y4zgZOhogFBMbdOx4jQu2IqYWKXPJUcOhrzXAGb3pPxoksBSZ67R2K4XkHkl0AkXXa/ea9tS1
 e0kya++MR7hoqEIWNSuFvflcMn9OMPnotXvnm3XCWHDHgCJ18yOnFelNlhhaANbDCMf43iifg
 ixf7EaV5AUqhOKhEynaC8soruSjuMX7bZPreFxLxa43VxlZYV9n3tADEqJzoPhpl06feitlnt
 tLrvNihVeWo92m6E66ZRWw98lVi9bg6sETloLyXUeIDOmtlOzUCMtlhHz78dJKEHVSmXERite
 F5o+baDwzLuoNPBk/g8qotFEXuanvTaxzntdq7Jhw7d48Idtdim0zZUfkA6uwFjeIixjMvSO1
 UKojVXgY0osepLFS+EKTk5wU2WfK7N7mU/Tlq7e4TXqmwvbeJ8RvegwdUopCcdu/++B0mhxaT
 wHssv+fP6MISUyzJOZcid70jrvmKDc3Qzb+ylZtNaaMRwoYVocf3ipRORmKSrew==

> when probe failed, workqueue not free. Convert the driver to use
=E2=80=A6

I find this wording approach improvable.

See also:
[PATCH v2] dmaengine: amlogic: Fix missing destroy_workqueue() at error pa=
th in aml_dma_probe()
https://lore.kernel.org/dmaengine/13a835b1770e360af7991bb4c91ce52a8d01e331=
.1792785154.git.christophe.jaillet@wanadoo.fr/

Regards,
Markus
